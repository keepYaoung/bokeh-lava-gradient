// ============================================================
// BokehLavaGradient — animated bokeh / lava gradient background
//
// 여러 색·크기의 블롭이 천천히 떠다니며 부드럽게 섞이는 보케 배경.
// 각 블롭은 자기 색의 soft radial-gradient 원, 전체에 Gaussian 블러 → 보케.
//
// 성능 최적화(외관은 거의 동일):
//   1) 저해상도 블러 — 블롭을 lowResFactor 배 버퍼에 그려 블러 후 업스케일.
//      블러 비용 ∝ 픽셀 수 → factor² 만큼 절감. 결과는 어차피 흐려서 차이 미미.
//   2) fps throttle — targetFps 로 제한(시간 기반 dt 라 속도는 유지).
//   3) 안 보일 때 정지 — Ticker(TickerMode)로 화면이 덮이면 자동 멈춤,
//      앱이 백그라운드로 가면 정지.
//
// 블롭의 바운싱 모션 아이디어는 lava_lamp_effect (MIT, © yashas-hm,
// https://github.com/yashas-hm/lava-lamp-effect) 의 Goblets 를 참고.
// ============================================================

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BokehLavaGradient extends StatefulWidget {
  /// 블롭 뒤를 채우는 베이스 색.
  final Color baseColor;

  /// 블롭에 순환 적용할 색들(브랜드 팔레트).
  final List<Color> colors;

  /// 블롭 개수.
  final int blobCount;

  /// 모션 속도(1=기본, 0.4=느긋).
  final double speed;

  /// 짧은 변 대비 블러 시그마 비율(보케 강도).
  final double blurStrength;

  /// 블롭 불투명도. 1 미만이면 겹친 블롭끼리 색이 섞여 다채로워진다.
  final double blobOpacity;

  /// 블롭 반경 범위(짧은 변 대비). min↔max 차이가 클수록 크기가 다양해진다.
  final double minBlobRadius;
  final double maxBlobRadius;

  /// [성능] 블러 버퍼 해상도 배율(0~1). 낮을수록 가볍고, 0.45 정도면
  /// 흐린 결과라 육안 차이가 거의 없다.
  final double lowResFactor;

  /// [성능] 목표 프레임레이트. 드리프트가 느려 30 정도면 충분.
  final int targetFps;

  final Widget? child;

  const BokehLavaGradient({
    super.key,
    this.baseColor = const Color(0xFFC65318),
    this.colors = const <Color>[
      Color(0xFFFFE6B8), // 페일 크림
      Color(0xFFFFD089), // 골든
      Color(0xFFFFB85C), // 앰버
      Color(0xFFFF9A43), // 라이트 오렌지
      Color(0xFFFC7C2C), // 오렌지
      Color(0xFFF26019), // 비비드 오렌지
      Color(0xFFD94E10), // 딥 오렌지
      Color(0xFFFFCBA0), // 피치 크림
      Color(0xFF932D00), // 딥 번트
    ],
    this.blobCount = 12,
    this.speed = 0.6,
    this.blurStrength = 0.05,
    this.blobOpacity = 0.85,
    this.minBlobRadius = 0.30,
    this.maxBlobRadius = 1.0,
    this.lowResFactor = 0.45,
    this.targetFps = 30,
    this.child,
  });

  @override
  State<BokehLavaGradient> createState() => _BokehLavaGradientState();
}

class _BokehLavaGradientState extends State<BokehLavaGradient>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final Ticker _ticker;
  late _BlobField _field;
  final ValueNotifier<int> _repaint = ValueNotifier<int>(0);
  Duration _last = Duration.zero;

  @override
  void initState() {
    super.initState();
    _field = _BlobField(widget.blobCount, widget.speed, widget.minBlobRadius,
        widget.maxBlobRadius);
    WidgetsBinding.instance.addObserver(this);
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    // targetFps 로 제한: 간격이 안 찼으면 스킵.
    final intervalUs = 1000000 / widget.targetFps;
    final dtUs = (elapsed - _last).inMicroseconds;
    if (_last != Duration.zero && dtUs < intervalUs) return;
    final dt = _last == Duration.zero ? 1 / widget.targetFps : dtUs / 1000000.0;
    _last = elapsed;
    _field.tick(dt);
    _repaint.value++; // CustomPaint(repaint:) 만 다시 그림 → setState 없음
  }

  @override
  void didUpdateWidget(covariant BokehLavaGradient old) {
    super.didUpdateWidget(old);
    if (widget.blobCount != old.blobCount ||
        widget.speed != old.speed ||
        widget.minBlobRadius != old.minBlobRadius ||
        widget.maxBlobRadius != old.maxBlobRadius) {
      _field = _BlobField(widget.blobCount, widget.speed, widget.minBlobRadius,
          widget.maxBlobRadius);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 백그라운드/비활성에서는 정지(배터리·GPU 절약).
    final active = state == AppLifecycleState.resumed;
    if (active && !_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    } else if (!active && _ticker.isActive) {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ticker.dispose();
    _repaint.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
        final h = constraints.maxHeight.isFinite ? constraints.maxHeight : 0.0;
        final f = widget.lowResFactor.clamp(0.1, 1.0);
        final lowW = max(1.0, w * f);
        final lowH = max(1.0, h * f);
        // 블러는 저해상도 버퍼에서. 업스케일(1/f) 후 풀해상도 sigma 와 동일.
        final sigma = max(0.1, min(lowW, lowH) * widget.blurStrength);

        final paintColors = <Color>[
          for (final c in widget.colors)
            c.withValues(alpha: widget.blobOpacity),
        ];

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ColoredBox(color: widget.baseColor),
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                child: Transform.scale(
                  scale: 1 / f,
                  alignment: Alignment.topLeft,
                  filterQuality: FilterQuality.low, // 부드러운 업스케일
                  child: SizedBox(
                    width: lowW,
                    height: lowH,
                    child: RepaintBoundary(
                      child: ImageFiltered(
                        imageFilter: ui.ImageFilter.blur(
                          sigmaX: sigma,
                          sigmaY: sigma,
                          tileMode: TileMode.decal,
                        ),
                        child: CustomPaint(
                          painter: _BlobPainter(_field, paintColors, _repaint),
                          child: const SizedBox.expand(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        );
      },
    );
  }
}

class _BlobPainter extends CustomPainter {
  final _BlobField field;
  final List<Color> colors;

  _BlobPainter(this.field, this.colors, Listenable repaint)
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    field.ensureSize(size); // 저해상도 버퍼 크기에서 동작

    for (int i = 0; i < field.blobs.length; i++) {
      final b = field.blobs[i];
      final c = colors[i % colors.length];
      final center = Offset(b.x, b.y);
      final shader = RadialGradient(
        colors: <Color>[c, c, c.withValues(alpha: 0)],
        stops: const <double>[0.0, 0.45, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: b.r));
      canvas.drawCircle(center, b.r, Paint()..shader = shader);
    }
  }

  // repaint(Listenable)로만 다시 그린다.
  @override
  bool shouldRepaint(_BlobPainter old) =>
      !identical(old.field, field) || !identical(old.colors, colors);
}

// ---- 떠다니는 블롭 필드 -------------------------------------------------

class _Blob {
  double x, y; // 중심
  double vx, vy; // 속도 (px/초)
  double r; // 반경
  _Blob(this.x, this.y, this.vx, this.vy, this.r);
}

class _BlobField {
  final int count;
  final double speed;
  final double minR;
  final double maxR;

  Size size = Size.zero;
  final List<_Blob> blobs = [];
  final Random _rand = Random();

  _BlobField(this.count, this.speed, this.minR, this.maxR);

  void ensureSize(Size newSize) {
    if (newSize == size && blobs.isNotEmpty) return;
    size = newSize;
    final shortest = size.shortestSide;
    blobs.clear();
    for (int i = 0; i < count; i++) {
      final r = shortest * (minR + (maxR - minR) * _rand.nextDouble());
      // 속도는 짧은 변 비율/초 → 해상도(저해상도 버퍼)와 무관하게 같은 체감.
      double v() => (_rand.nextBool() ? 1 : -1) *
          (0.3 + 0.9 * _rand.nextDouble()) *
          speed *
          shortest *
          0.06;
      blobs.add(_Blob(
        _rand.nextDouble() * size.width,
        _rand.nextDouble() * size.height,
        v(),
        v(),
        r,
      ));
    }
  }

  /// dt(초)만큼 이동, 벽 반사. 중심이 반경 일부만큼 밖으로 나가도 허용.
  void tick(double dt) {
    if (blobs.isEmpty) return;
    final bounds = size;
    for (final b in blobs) {
      b.x += b.vx * dt;
      b.y += b.vy * dt;
      final mx = b.r * 0.4;
      if (b.x < -mx) {
        b.x = -mx;
        b.vx = -b.vx;
      } else if (b.x > bounds.width + mx) {
        b.x = bounds.width + mx;
        b.vx = -b.vx;
      }
      if (b.y < -mx) {
        b.y = -mx;
        b.vy = -b.vy;
      } else if (b.y > bounds.height + mx) {
        b.y = bounds.height + mx;
        b.vy = -b.vy;
      }
    }
  }
}
