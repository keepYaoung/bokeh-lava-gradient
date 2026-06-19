// TEMPORARY generator — renders 3 presets in sequence to doc/bokeh_demo.gif.
// Not part of the package (excluded via .pubignore).
//
//   flutter test test/gen_gif_test.dart

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

import 'package:bokeh_lava_gradient/bokeh_lava_gradient.dart';

void main() {
  const logical = Size(260, 560); // GIF 표시 크기 (README ~280px)
  const dpr = 1.0;
  const framesPer = 22; // 프리셋당 프레임
  const tickMs = 70; // 프레임 간 시간 진행
  // live simulation 아래 미리보기 3종과 동일한 색상 순서
  const presets = <BokehTheme>[
    BokehTheme.og,
    BokehTheme.light2,
    BokehTheme.dark3,
  ];

  testWidgets('generate demo gif', (tester) async {
    tester.view.physicalSize = logical * dpr;
    tester.view.devicePixelRatio = dpr;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final anim = img.Image(
      width: logical.width.toInt(),
      height: logical.height.toInt(),
      numChannels: 4,
    );
    anim.frames.clear();

    for (final theme in presets) {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              RepaintBoundary(key: key, child: BokehLavaGradient.preset(theme)),
        ),
      );
      final boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;

      for (var f = 0; f < framesPer; f++) {
        await tester.pump(const Duration(milliseconds: tickMs));
        late Uint8List rgba;
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: dpr);
          final bd = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
          rgba = bd!.buffer.asUint8List();
          image.dispose();
        });
        final frame = img.Image.fromBytes(
          width: logical.width.toInt(),
          height: logical.height.toInt(),
          bytes: rgba.buffer,
          numChannels: 4,
          order: img.ChannelOrder.rgba,
        );
        // 색상 전환 직후 1프레임 더 머무르게(가독성)
        frame.frameDuration = (f == framesPer - 1) ? 18 : tickMs ~/ 10;
        anim.frames.add(frame);
      }
    }

    final gif = img.encodeGif(anim, repeat: 0, samplingFactor: 10);
    Directory('doc').createSync(recursive: true);
    File('doc/bokeh_demo.gif').writeAsBytesSync(gif);
    // ignore: avoid_print
    print('wrote doc/bokeh_demo.gif  '
        '(${gif.length ~/ 1024} KB, ${anim.frames.length} frames, '
        '${presets.length} presets)');
  });
}
