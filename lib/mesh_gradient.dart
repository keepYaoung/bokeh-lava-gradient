// ============================================================
// Mesh Gradient Background  (path-faithful 재현)
//
// Figma: MVP ~ 1.0.0 / 내부 디자인
//        (node redacted, frames f_01 ~ f_04)
//
// Figma SVG export 의 실제 벡터 path / linear gradient / feGaussianBlur 를
// 그대로 옮겨 그린다. 원형 blob 근사가 아니라 디자인의 유기적 셰이프 자체를
// 사용하므로 레퍼런스 메시 느낌이 그대로 산다.
//
//   - 각 셰이프 path 는 viewBox(1892×1178 등) 좌표 → 화면 좌표로 스케일.
//     preserveAspectRatio="none" 라 가로/세로 따로 늘려(non-uniform) 매핑.
//   - 셰이프마다 MaskFilter.blur(stdDeviation) 로 개별 블러 (Figma 와 1:1).
//   - 베이스는 solid 또는 linear gradient 채움.
//
// 전환: 프레임마다 path 토폴로지가 달라 lerp 불가 → 크로스페이드.
// 드리프트: 캐싱된(RepaintBoundary) 메시 레이어에 가벼운 transform 만 적용.
//
// 사용 예:
//   MeshGradient(preset: MeshPreset.f01, child: ...)
//   // preset 만 바꾸면 부드럽게 크로스페이드된다.
// ============================================================

import 'dart:math' as math;
import 'dart:ui' as ui show Gradient;

import 'package:flutter/material.dart';

// ---- fill / shape / preset 데이터 (Figma 원본 1:1) ---------------------

/// solid 또는 linear gradient 채움. 좌표는 viewBox(userSpace) 기준.
@immutable
class _Fill {
  final Color? color;
  final Offset? from;
  final Offset? to;
  final List<Color>? colors;
  final List<double>? stops;

  const _Fill.solid(this.color)
      : from = null,
        to = null,
        colors = null,
        stops = null;

  const _Fill.linear(this.from, this.to, this.colors, this.stops)
      : color = null;

  /// 화면 스케일(sx, sy)을 반영해 Paint 에 채움을 적용한다.
  void applyTo(Paint paint, double sx, double sy) {
    if (color != null) {
      paint
        ..color = color!
        ..shader = null;
    } else {
      paint.shader = ui.Gradient.linear(
        Offset(from!.dx * sx, from!.dy * sy),
        Offset(to!.dx * sx, to!.dy * sy),
        colors!,
        stops,
      );
    }
  }
}

@immutable
class _Shape {
  final String d; // SVG path data (M/L/C/Z, 절대좌표)
  final _Fill fill;
  final double blur; // feGaussianBlur stdDeviation (userSpace)
  const _Shape(this.d, this.fill, this.blur);
}

/// 하나의 배경 프레임(f_01 ~ f_04).
@immutable
class MeshPreset {
  final String name;
  final Size viewBox;
  final _Fill _base;
  final List<_Shape> _shapes;

  const MeshPreset._(this.name, this.viewBox, this._base, this._shapes);

  // 자주 쓰는 원색
  static const _orange = Color(0xFFF1723A);
  static const _burnt = Color(0xFF932D00);
  static const _cream = Color(0xFFE4C188);

  // ---- f_01 : 밝은 오렌지 + 크림 하이라이트 --------------------------
  static const f01 = MeshPreset._(
    'f_01',
    Size(1892, 1178),
    _Fill.solid(_burnt),
    <_Shape>[
      _Shape(
        'M1370.22 -280.076C1591.32 -906.976 625.56 -208.404 348.955 -111.884C246.404 -82.5074 262.398 482.523 348.955 611.535C435.511 740.546 -631.872 370.714 -457.818 611.535C-283.764 852.356 721.986 1792.7 1022.11 1896.87C1322.24 2001.03 602.5 1351.2 744.566 989.013C886.632 626.825 2256.48 708.054 1836.87 675.563C1417.26 643.071 1230.08 117.267 1370.22 -280.076Z',
        _Fill.linear(Offset(991.844, -37.4721), Offset(499.107, 1136.03),
            <Color>[Color(0xFFFF8F5E), Color(0xFFDD551A)], <double>[0, 1]),
        226.545,
      ),
      _Shape(
        'M-168.986 1139.34C-326.528 864.183 -220.172 527.176 177.533 372.791C351.104 282.721 619.191 430.924 849 687.628C1078.81 944.332 864.817 1091.44 515.413 1351.55C166.01 1611.66 -11.443 1414.49 -168.986 1139.34Z',
        _Fill.linear(Offset(-567.5, 1292), Offset(912.803, 738.537),
            <Color>[_orange, _burnt], <double>[0, 1]),
        203.891,
      ),
      _Shape(
        'M2102.76 609.107C1790.14 628.774 1415.56 445.544 1155.61 349.62C1058.94 313.948 874.387 215.147 698.571 150.606C699.585 -169.555 821.868 -341.454 388.354 95.8306C329.009 107.438 286.989 142.562 273.5 212.5C315.56 169.568 353.73 130.756 388.354 95.8306C469.097 80.0385 581.911 107.78 698.571 150.606C698.227 259.324 711.866 385.138 766 510C1043.19 1149.34 1173.72 1874.85 1221 1918C1306.89 1996.37 1941.1 1009.54 2002.49 1088.87L2102.76 609.107Z',
        _Fill.linear(Offset(1964.5, 844), Offset(842.473, 412.042),
            <Color>[_burnt, _cream], <double>[0, 1]),
        113.273,
      ),
    ],
  );

  // ---- f_02 : 좌상단 다크 + 우측 피치 --------------------------------
  static const f02 = MeshPreset._(
    'f_02',
    Size(1892, 1178),
    _Fill.solid(Color(0xFFFFAE8A)),
    <_Shape>[
      _Shape(
        'M1065.06 -96.0338C481.258 -706.438 2692.3 -344.456 3043.77 -221.816C3174.07 -184.489 3153.75 533.456 3043.77 697.381C2933.79 861.307 4290.03 391.387 4068.88 697.381C3847.72 1003.38 2569.78 2198.21 2188.43 2330.56C1807.09 2462.92 2721.6 1637.22 2541.09 1177.02C2360.58 716.81 142.08 1221.93 246.117 697.381C289.295 479.677 1696.91 564.594 1065.06 -96.0338Z',
        _Fill.solid(_burnt),
        287.855,
      ),
      _Shape(
        'M1921.01 1192.24C1996.47 1060.45 1384.94 521.872 1194.45 447.928C1111.32 404.788 81.4997 565.378 -73.9763 510.065C-2310.87 -285.743 -1170.97 1653.79 600.845 1617.69C939.319 1610.79 1300.85 1531.8 1666.31 1347.86C1852.67 1254.07 1845.55 1324.03 1921.01 1192.24Z',
        _Fill.linear(Offset(395.963, 504.177), Offset(715.143, 855.158),
            <Color>[Color(0xFF000000), _burnt], <double>[0, 1]),
        252.449,
      ),
      _Shape(
        'M2236.24 1429.23C2388.56 1163.2 2432.96 1041.03 2048.44 891.763C1880.63 804.679 -274.01 727.048 -496.199 975.241C-718.388 1223.43 -1001.38 2336.8 1722.1 1743.37C2133.6 1653.7 2083.92 1695.26 2236.24 1429.23Z',
        _Fill.linear(Offset(-1315.15, 1172.42), Offset(1737.56, 721.928),
            <Color>[Color(0x00FFFFFF), Color(0xFFB14516)], <double>[0, 1]),
        259.07,
      ),
      _Shape(
        'M631.309 275.447C758.358 258.983 849.372 158.357 947.487 542.514C1695.47 1121.2 2019.17 1644.46 1858.11 1784.7C1697.05 1924.95 471.64 833.223 20.6172 740.328C-421.356 649.296 351.149 523.944 343.229 492.931C474.595 514.262 529.67 288.618 631.309 275.447Z',
        _Fill.solid(_orange),
        343.124,
      ),
      _Shape(
        'M623.742 636.608C675.395 629.914 741.032 961.436 1265.12 781.527C1440.77 893.407 2859.12 1402.41 2793.64 1459.43C2728.15 1516.44 269.726 1384.93 86.3566 1347.16C-93.3334 1310.15 509.839 737.637 506.618 725.029C560.027 733.701 582.419 641.962 623.742 636.608Z',
        _Fill.solid(_orange),
        154.434,
      ),
    ],
  );

  // ---- f_03 : 다크 무드 (블랙/브라운 그림자) -------------------------
  static const f03 = MeshPreset._(
    'f_03',
    Size(1892, 1178),
    _Fill.solid(_orange),
    <_Shape>[
      _Shape(
        'M1976.63 -98.3968C2190.32 -704.303 1256.9 -29.124 989.56 64.1634C890.443 92.5562 905.902 638.666 989.56 763.357C1073.22 888.048 41.5783 530.6 209.804 763.357C378.029 996.114 1350.1 1904.97 1640.17 2005.65C1930.25 2106.33 1234.62 1478.25 1371.92 1128.19C1509.23 778.135 2833.21 856.645 2427.65 825.241C2022.09 793.837 1841.18 285.64 1976.63 -98.3968Z',
        _Fill.linear(
            Offset(2504.55, 834.147),
            Offset(-384.5, 1938.5),
            <Color>[Color(0xFF000000), Color(0xFF712300), _burnt],
            <double>[0, 0.771704, 1]),
        218.959,
      ),
      _Shape(
        'M-194.145 553.638C329.167 483.571 360.368 -62.9202 723.316 -177.123C1028.99 -273.303 1150.58 676.081 1967.43 1043.94L2505.62 1178.77C2297.96 1161.38 2120.49 1112.87 1967.43 1043.94L1452.43 914.921L620.383 635.748L-194.145 553.638Z',
        _Fill.linear(Offset(1156, 593.5), Offset(8.5, 29.9999),
            <Color>[_burnt, Color(0xFFFFEEC7)], <double>[0, 1]),
        218.959,
      ),
      _Shape(
        'M1650.65 596.105C1720.08 721.386 1971.23 539.471 1966.94 834.654C1966.94 990.826 2652.65 1622.28 2527.5 1687.5C2402.35 1752.71 1609.9 1441.14 1471.04 1502.06C1332.18 1562.98 1035.2 1425.02 1039.49 1355.51C1043.77 1286.01 1238.35 1199.34 1290.64 834.654C1342.92 469.965 1581.22 470.824 1650.65 596.105Z',
        _Fill.solid(_orange),
        166.956,
      ),
    ],
  );

  // ---- f_04 : 피치→크림 + 딥 번트 ------------------------------------
  static const f04 = MeshPreset._(
    'f_04',
    Size(1892, 1151),
    _Fill.linear(Offset(0, 575.5), Offset(1892, 575.5),
        <Color>[Color(0xFFFFAE8A), _cream], <double>[0, 1]),
    <_Shape>[
      _Shape(
        'M1559.59 -388.93C1788.34 -1037.51 789.171 -314.778 502.998 -214.919C396.899 -184.526 413.447 400.05 502.998 533.524C592.548 666.997 -178.499 533.524 -178.5 1109C-178.5 1815 888.933 1755.55 1199.44 1863.32C1509.95 1971.09 765.314 1298.77 912.294 924.059C1059.27 549.343 2476.51 633.382 2042.39 599.766C1608.26 566.151 1414.61 22.158 1559.59 -388.93Z',
        _Fill.linear(Offset(1308, 609.3), Offset(1715, 609.3),
            <Color>[Color(0xFFDD551A), Color(0xFFFFCDB7)], <double>[0, 1]),
        234.382,
      ),
      _Shape(
        'M420.446 671.856C665.192 246.985 770.506 -44.1644 1159.02 -166.411C1518.08 -279.392 1395.4 894.829 2948.37 1252.03L3365.46 1322.27C3214.36 1305.12 3075.73 1281.32 2948.37 1252.03L1891.78 1074.1L1045.07 782.015L420.446 671.856Z',
        _Fill.linear(Offset(420.446, 574.115), Offset(3365.46, 574.115),
            <Color>[_burnt, Color(0xFFEE6326)], <double>[0, 1]),
        351.573,
      ),
    ],
  );

  static const List<MeshPreset> all = <MeshPreset>[f01, f02, f03, f04];
}

// ---- SVG path 파서 (M/L/C/Z 절대좌표) ----------------------------------

final Map<String, Path> _pathCache = <String, Path>{};
final RegExp _token =
    RegExp(r'([MLCZ])|(-?\d*\.?\d+(?:[eE][-+]?\d+)?)');

Path _parsePath(String d) {
  return _pathCache.putIfAbsent(d, () {
    final path = Path();
    final tokens = _token.allMatches(d).toList();
    var i = 0;
    String cmd = '';
    double next() => double.parse(tokens[i++].group(0)!);

    while (i < tokens.length) {
      final letter = tokens[i].group(1);
      if (letter != null) {
        cmd = letter;
        i++;
      }
      switch (cmd) {
        case 'M':
          final x = next(), y = next();
          path.moveTo(x, y);
          cmd = 'L'; // 이후 좌표쌍은 암묵적 lineTo
          break;
        case 'L':
          path.lineTo(next(), next());
          break;
        case 'C':
          path.cubicTo(next(), next(), next(), next(), next(), next());
          break;
        case 'Z':
          path.close();
          break;
        default:
          i++; // 안전장치
      }
    }
    return path;
  });
}

// ---- 위젯 --------------------------------------------------------------

/// Figma 메시 배경. [preset] 을 바꾸면 [crossDuration] 동안 크로스페이드된다.
/// [animateAmbient] 면 가만히 있어도 메시가 천천히 일렁인다.
class MeshGradient extends StatefulWidget {
  final MeshPreset preset;
  final Duration crossDuration;
  final Curve curve;
  final bool animateAmbient;

  /// 앰비언트 드리프트 세기(0=정지, 1=기본).
  final double driftAmount;
  final Duration driftPeriod;

  final Widget? child;

  const MeshGradient({
    super.key,
    required this.preset,
    this.crossDuration = const Duration(milliseconds: 1100),
    this.curve = Curves.easeInOut,
    this.animateAmbient = true,
    this.driftAmount = 1.0,
    this.driftPeriod = const Duration(seconds: 18),
    this.child,
  });

  @override
  State<MeshGradient> createState() => _MeshGradientState();
}

class _MeshGradientState extends State<MeshGradient>
    with TickerProviderStateMixin {
  late final AnimationController _cross;
  late final AnimationController _drift;
  late MeshPreset _prev;
  late MeshPreset _cur;

  @override
  void initState() {
    super.initState();
    _prev = widget.preset;
    _cur = widget.preset;
    _cross = AnimationController(vsync: this, duration: widget.crossDuration)
      ..value = 1.0;
    _drift = AnimationController(vsync: this, duration: widget.driftPeriod);
    if (widget.animateAmbient) _drift.repeat();
  }

  @override
  void didUpdateWidget(covariant MeshGradient oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(widget.preset, oldWidget.preset)) {
      _prev = _cur;
      _cur = widget.preset;
      _cross
        ..duration = widget.crossDuration
        ..forward(from: 0.0);
    }
    if (widget.driftPeriod != oldWidget.driftPeriod) {
      _drift.duration = widget.driftPeriod;
    }
    if (widget.animateAmbient && !_drift.isAnimating) {
      _drift.repeat();
    } else if (!widget.animateAmbient && _drift.isAnimating) {
      _drift.stop();
    }
  }

  @override
  void dispose() {
    _cross.dispose();
    _drift.dispose();
    super.dispose();
  }

  // 캐싱되는 단일 메시 레이어
  Widget _layer(MeshPreset preset) => RepaintBoundary(
        child: CustomPaint(
          size: Size.infinite,
          painter: _MeshPainter(preset),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;

        final mesh = AnimatedBuilder(
          animation: _cross,
          builder: (context, _) {
            final t = widget.curve.transform(_cross.value.clamp(0.0, 1.0));
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                if (t < 1.0 && !identical(_prev, _cur)) _layer(_prev),
                Opacity(opacity: t, child: _layer(_cur)),
              ],
            );
          },
        );

        // 드리프트: 캐싱된 메시를 살짝 확대(항상 ≥1)·이동시켜 일렁임.
        // 항상 확대 상태라 이동해도 가장자리가 노출되지 않는다.
        final Widget drifted = widget.animateAmbient && widget.driftAmount > 0
            ? AnimatedBuilder(
                animation: _drift,
                child: mesh,
                builder: (context, child) {
                  final a = 2 * math.pi * _drift.value;
                  final amp = widget.driftAmount;
                  final scale = 1.05 + 0.02 * amp * math.sin(a);
                  final dx = size.width * 0.01 * amp * math.sin(a);
                  final dy = size.height * 0.01 * amp * math.cos(a);
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translateByDouble(dx, dy, 0, 1)
                      ..scaleByDouble(scale, scale, 1, 1),
                    child: child,
                  );
                },
              )
            : mesh;

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRect(child: drifted),
            if (widget.child != null) widget.child!,
          ],
        );
      },
    );
  }
}

class _MeshPainter extends CustomPainter {
  final MeshPreset preset;
  const _MeshPainter(this.preset);

  @override
  void paint(Canvas canvas, Size size) {
    final vb = preset.viewBox;
    final sx = size.width / vb.width;
    final sy = size.height / vb.height;
    final s = (sx + sy) / 2; // 블러는 균일 시그마라 평균 스케일 사용

    // 1) 베이스 채움 (화면 전체, 블러 없음 → 가장자리까지 꽉 참)
    final basePaint = Paint()..isAntiAlias = true;
    preset._base.applyTo(basePaint, sx, sy);
    canvas.drawRect(Offset.zero & size, basePaint);

    // 2) 셰이프들: viewBox 좌표를 화면 좌표로 스케일, 각자 블러
    final matrix = Matrix4.diagonal3Values(sx, sy, 1).storage;
    for (final shape in preset._shapes) {
      final screenPath = _parsePath(shape.d).transform(matrix);
      final paint = Paint()..isAntiAlias = true;
      if (shape.blur > 0) {
        paint.maskFilter = MaskFilter.blur(BlurStyle.normal, shape.blur * s);
      }
      shape.fill.applyTo(paint, sx, sy);
      canvas.drawPath(screenPath, paint);
    }
  }

  @override
  bool shouldRepaint(_MeshPainter old) => !identical(old.preset, preset);
}
