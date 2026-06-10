// Demo app for bokeh_lava_gradient.
//
//   flutter run            (any device)
//   flutter run -d chrome  (web — same as the live demo)

import 'package:flutter/material.dart';

import 'bokeh_lava_gradient.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bokeh / Lava Gradient',
      debugShowCheckedModeBanner: false,
      home: DemoScreen(),
    );
  }
}

const _labels = <BokehTheme, String>{
  BokehTheme.og: 'OG',
  BokehTheme.light1: 'Light 1',
  BokehTheme.light2: 'Light 2',
  BokehTheme.dark1: 'Dark 1',
  BokehTheme.dark2: 'Dark 2',
};

const _captions = <BokehTheme, String>{
  BokehTheme.og: 'original · burnt orange + 9-color gradient',
  BokehTheme.light1: 'bright cream · soft pastel peach blobs',
  BokehTheme.light2: 'warm beige · muted orange & rose',
  BokehTheme.dark1: 'deep burnt orange · glowing amber',
  BokehTheme.dark2: 'near-black · strong orange glow',
};

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  BokehTheme _theme = BokehTheme.og;

  @override
  Widget build(BuildContext context) {
    // 배경 밝기에 따라 텍스트 색 대비를 맞춘다.
    final onColor = bokehThemeBrightness(_theme) == Brightness.light
        ? const Color(0xFF3A1A0A)
        : Colors.white;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // preset 만 바꾸면 같은 State 를 유지한 채 팔레트가 바뀐다
          // (블롭은 계속 떠다니고 색만 전환).
          BokehLavaGradient.preset(_theme),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ThemeToggle(
                    theme: _theme,
                    onColor: onColor,
                    onChanged: (t) => setState(() => _theme = t),
                  ),
                  const Spacer(),
                  Text(
                    _labels[_theme]!,
                    style: TextStyle(
                      color: onColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _captions[_theme]!,
                    style: TextStyle(
                      color: onColor.withValues(alpha: 0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final BokehTheme theme;
  final Color onColor;
  final ValueChanged<BokehTheme> onChanged;

  const _ThemeToggle({
    required this.theme,
    required this.onColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final light = onColor != Colors.white;
    // 탭 5개라 좁은 화면에서 넘치지 않게 가로 스크롤.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: (light ? Colors.white : Colors.black).withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final t in BokehTheme.values) _tab(t),
          ],
        ),
      ),
    );
  }

  Widget _tab(BokehTheme t) {
    final selected = theme == t;
    return GestureDetector(
      onTap: () => onChanged(t),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? onColor : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          _labels[t]!,
          style: TextStyle(
            color: selected
                ? (onColor == Colors.white ? Colors.black : Colors.white)
                : onColor,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
