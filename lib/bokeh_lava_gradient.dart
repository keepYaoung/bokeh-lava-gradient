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

/// 미리 정의된 배경 테마. 원본(og) + 라이트 2 + 다크 3.
enum BokehTheme { og, light1, light2, dark1, dark2, dark3 }

class _BokehPreset {
  final Color base;
  final List<Color> colors;
  final double opacity;
  final Brightness brightness; // 위에 올릴 콘텐츠/텍스트 대비용
  const _BokehPreset(this.base, this.colors, this.opacity, this.brightness);
}

const Map<BokehTheme, _BokehPreset> _kPresets = <BokehTheme, _BokehPreset>{
  // og — 원본 기본값 (밝은 번트 바탕 + 오렌지 그라데이션 9색)
  BokehTheme.og: _BokehPreset(
    Color(0xFFC65318),
    <Color>[
      Color(0xFFFFE6B8),
      Color(0xFFFFD089),
      Color(0xFFFFB85C),
      Color(0xFFFF9A43),
      Color(0xFFFC7C2C),
      Color(0xFFF26019),
      Color(0xFFD94E10),
      Color(0xFFFFCBA0),
      Color(0xFF932D00),
    ],
    0.85,
    Brightness.dark,
  ),
  // light1 — 밝은 크림 바탕 + 소프트 파스텔 피치/살구 (화사·가벼움)
  BokehTheme.light1: _BokehPreset(
    Color(0xFFFFF1E2),
    <Color>[
      Color(0xFFFFE0C8),
      Color(0xFFFFD3B0),
      Color(0xFFFFC9A8),
      Color(0xFFFFE6D6),
      Color(0xFFFAD4B8),
      Color(0xFFFFBE99),
      Color(0xFFFFEAD2),
    ],
    0.6,
    Brightness.light,
  ),
  // light2 — 웜 베이지/그레이 바탕 + 뮤트 오렌지·로즈 (차분·웜뉴트럴)
  BokehTheme.light2: _BokehPreset(
    Color(0xFFEFE6DB),
    <Color>[
      Color(0xFFE6C7AE),
      Color(0xFFDCB49E),
      Color(0xFFD3A892),
      Color(0xFFE8CBB8),
      Color(0xFFD8A88C),
      Color(0xFFCFA0A0),
      Color(0xFFE2BBA0),
    ],
    0.55,
    Brightness.light,
  ),
  // dark1 — 딥 번트 바탕 + 글로우 오렌지/앰버 (현재 기본과 ≈)
  BokehTheme.dark1: _BokehPreset(
    Color(0xFF8F2C00),
    <Color>[
      Color(0xFFFFE6B8),
      Color(0xFFFFD089),
      Color(0xFFFFB85C),
      Color(0xFFFF9A43),
      Color(0xFFFC7C2C),
      Color(0xFFF26019),
      Color(0xFFD94E10),
      Color(0xFFFFCBA0),
      Color(0xFF932D00),
    ],
    0.85,
    Brightness.dark,
  ),
  // dark2 — 거의 블랙 바탕 + 강한 오렌지 글로우 (드라마틱·하이콘트라스트)
  BokehTheme.dark2: _BokehPreset(
    Color(0xFF160B04),
    <Color>[
      Color(0xFFFF8A2A),
      Color(0xFFFF6A14),
      Color(0xFFFFB152),
      Color(0xFFFFC97A),
      Color(0xFFE2530E),
      Color(0xFF7A2600),
      Color(0xFFFFD089),
    ],
    0.9,
    Brightness.dark,
  ),
  // dark3 — 블랙 바탕 + 틸/그린 + 오렌지 글로우 (오렌지 비중↑)
  BokehTheme.dark3: _BokehPreset(
    Color(0xFF000000),
    <Color>[
      Color(0xFF09353C),
      Color(0xFFF1723A),
      Color(0xFF64AA74),
      Color(0xFFDD551A),
      Color(0xFF034753),
      Color(0xFFF1723A),
      Color(0xFFDD551A),
    ],
    0.9,
    Brightness.dark,
  ),
};

/// 프리셋의 밝기(위에 올릴 텍스트/아이콘 색 대비에 사용).
Brightness bokehThemeBrightness(BokehTheme theme) =>
    _kPresets[theme]!.brightness;

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

  /// 미리 정의된 라이트/다크 테마로 생성. (baseColor·colors·blobOpacity 세팅)
  /// 나머지 노브는 기본값이며 필요시 개별 인자로 덮어쓸 수 있다.
  factory BokehLavaGradient.preset(
    BokehTheme theme, {
    Key? key,
    int? blobCount,
    double? speed,
    double? blurStrength,
    double? minBlobRadius,
    double? maxBlobRadius,
    double? lowResFactor,
    int? targetFps,
    Widget? child,
  }) {
    final p = _kPresets[theme]!;
    return BokehLavaGradient(
      key: key,
      baseColor: p.base,
      colors: p.colors,
      blobOpacity: p.opacity,
      blobCount: blobCount ?? 12,
      speed: speed ?? 0.6,
      blurStrength: blurStrength ?? 0.05,
      minBlobRadius: minBlobRadius ?? 0.30,
      maxBlobRadius: maxBlobRadius ?? 1.0,
      lowResFactor: lowResFactor ?? 0.45,
      targetFps: targetFps ?? 30,
      child: child,
    );
  }

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
