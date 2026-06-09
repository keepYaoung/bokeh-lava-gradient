// Demo app for bokeh_lava_gradient.
//
//   flutter run            (any device)
//   flutter run -d chrome  (web — same as the live demo)

import 'dart:async';

import 'package:flutter/material.dart';

import 'bokeh_lava_gradient.dart';
import 'mesh_gradient.dart';

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

enum _Mode { lava, mesh }

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  _Mode _mode = _Mode.lava;

  // mesh cycling
  int _meshIndex = 0;
  Timer? _meshTimer;

  @override
  void initState() {
    super.initState();
    _meshTimer = Timer.periodic(
      const Duration(milliseconds: 4000),
      (_) {
        if (_mode == _Mode.mesh) {
          setState(() =>
              _meshIndex = (_meshIndex + 1) % MeshPreset.all.length);
        }
      },
    );
  }

  @override
  void dispose() {
    _meshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final background = _mode == _Mode.lava
        ? const BokehLavaGradient()
        : MeshGradient(
            preset: MeshPreset.all[_meshIndex],
            crossDuration: const Duration(milliseconds: 3000),
          );

    return Scaffold(
      backgroundColor: const Color(0xFF932D00),
      body: Stack(
        fit: StackFit.expand,
        children: [
          background,
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Segmented(
                    mode: _mode,
                    onChanged: (m) => setState(() => _mode = m),
                  ),
                  const Spacer(),
                  Text(
                    _mode == _Mode.lava
                        ? 'bokeh lava'
                        : 'mesh gradient · ${MeshPreset.all[_meshIndex].name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _mode == _Mode.lava
                        ? 'soft colored blobs drifting + Gaussian blur'
                        : 'Figma frames f_01–f_04, cross-fading',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.82),
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

class _Segmented extends StatelessWidget {
  final _Mode mode;
  final ValueChanged<_Mode> onChanged;

  const _Segmented({required this.mode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tab('Bokeh Lava', _Mode.lava),
          _tab('Mesh', _Mode.mesh),
        ],
      ),
    );
  }

  Widget _tab(String label, _Mode m) {
    final selected = mode == m;
    return GestureDetector(
      onTap: () => onChanged(m),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF932D00) : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
