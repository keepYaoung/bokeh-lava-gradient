// ============================================================
// Lava / Bokeh Background
//
// 여러 색·크기의 블롭이 천천히 떠다니며 부드럽게 섞이는 보케 배경.
//
// 각 블롭은 자기 색을 가진 soft radial-gradient 원으로 그리고, 전체에
// Gaussian 블러를 입혀 보케화한다. (메타볼처럼 합쳐지지 않으므로 모든
// 색이 그대로 보인다.)
//
// 블롭의 바운싱 모션 아이디어는 lava_lamp_effect (MIT, © yashas-hm,
// https://github.com/yashas-hm/lava-lamp-effect) 의 Goblets 를 참고.
//
// 사용 예:
//   BokehLavaGradient(child: ...)
// ============================================================

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// ---- 위젯 --------------------------------------------------------------

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

  final Duration repeatDuration;
  final Widget? child;

  const BokehLavaGradient({
    super.key,
    // 살짝 밝은 번트 오렌지 베이스
    this.baseColor = const Color(0xFFC65318),
    // 대비 큰 오렌지 그라데이션 (크림→골든→앰버→오렌지→딥)
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
    this.repeatDuration = const Duration(seconds: 14),
    this.child,
  });

  @override
  State<BokehLavaGradient> createState() => _BokehLavaGradientState();
}

class _BokehLavaGradientState extends State<BokehLavaGradient>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctr;
  late _BlobField _field;

  @override
  void initState() {
    super.initState();
    _field = _BlobField(
        widget.blobCount, widget.speed, widget.minBlobRadius, widget.maxBlobRadius);
    _ctr = AnimationController(vsync: this, duration: widget.repeatDuration)
      ..repeat();
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
    if (widget.repeatDuration != old.repeatDuration) {
      _ctr.duration = widget.repeatDuration;
    }
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sigma =
            max(0.1, constraints.biggest.shortestSide * widget.blurStrength);

        // 블롭에 알파를 입혀, 겹친 블롭끼리 색이 섞이게 한다.
        final paintColors = <Color>[
          for (final c in widget.colors)
            c.withValues(alpha: widget.blobOpacity),
        ];

        final blobs = RepaintBoundary(
          child: AnimatedBuilder(
            animation: _ctr,
            builder: (context, _) => CustomPaint(
              size: Size.infinite,
              painter: _BlobPainter(_field, paintColors),
            ),
          ),
        );

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ColoredBox(color: widget.baseColor),
            ClipRect(
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: sigma,
                  sigmaY: sigma,
                  tileMode: TileMode.decal,
                ),
                child: blobs,
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

  _BlobPainter(this.field, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    field.ensureSize(size);
    field.tick(size);

    for (int i = 0; i < field.blobs.length; i++) {
      final b = field.blobs[i];
      final c = colors[i % colors.length];
      final center = Offset(b.x, b.y);
      // 코어는 색이 꽉 차고 가장자리로 부드럽게 사라지는 원(보케).
      final shader = RadialGradient(
        colors: <Color>[c, c, c.withValues(alpha: 0)],
        stops: const <double>[0.0, 0.45, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: b.r));
      canvas.drawCircle(center, b.r, Paint()..shader = shader);
    }
  }

  @override
  bool shouldRepaint(_BlobPainter oldDelegate) => true;
}

// ---- 떠다니는 블롭 필드 -------------------------------------------------

class _Blob {
  double x, y; // 중심
  double vx, vy; // 속도
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
      double v() => (_rand.nextBool() ? 1 : -1) *
          (0.3 + 0.9 * _rand.nextDouble()) *
          speed;
      blobs.add(_Blob(
        _rand.nextDouble() * size.width,
        _rand.nextDouble() * size.height,
        v(),
        v(),
        r,
      ));
    }
  }

  /// 매 프레임 블롭을 이동시키고, 벽에 닿으면 반사. 중심이 화면 밖으로
  /// 조금 나가도 되게 둬서(반경만큼 여유) 가장자리에서도 색이 차게 한다.
  void tick(Size bounds) {
    for (final b in blobs) {
      b.x += b.vx;
      b.y += b.vy;
      final mx = b.r * 0.4; // 허용 여백(중심이 살짝 밖으로)
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
