// Renders each active preset to PNG at 375x812 @2x (750x1624), 3 random
// variants each, into ./captures/.
//
//   flutter test test/capture_test.dart

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bokeh_lava_gradient/bokeh_lava_gradient.dart';

void main() {
  const logical = Size(375, 812);
  const dpr = 2.0;
  const themes = <BokehTheme>[
    BokehTheme.og,
    BokehTheme.light2,
    BokehTheme.dark3,
    BokehTheme.dark4,
  ];

  final outDir = Directory('captures');

  for (final theme in themes) {
    for (var i = 1; i <= 3; i++) {
      testWidgets('capture ${theme.name} $i', (tester) async {
        tester.view.physicalSize = logical * dpr;
        tester.view.devicePixelRatio = dpr;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        outDir.createSync(recursive: true);

        final key = GlobalKey();
        await tester.pumpWidget(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: RepaintBoundary(
              key: key,
              child: BokehLavaGradient.preset(theme),
            ),
          ),
        );
        // advance the ticker a touch so motion differs between variants
        await tester.pump(const Duration(milliseconds: 250));
        await tester.pump(const Duration(milliseconds: 250));

        final boundary =
            key.currentContext!.findRenderObject()! as RenderRepaintBoundary;

        // toImage relies on real async — must run outside the fake-async zone.
        late Uint8List png;
        late int w, h;
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: dpr);
          w = image.width;
          h = image.height;
          final bd = await image.toByteData(format: ui.ImageByteFormat.png);
          png = bd!.buffer.asUint8List();
          image.dispose();
        });

        File('${outDir.path}/${theme.name}_$i.png').writeAsBytesSync(png);
        // ignore: avoid_print
        print('wrote ${theme.name}_$i.png  (${w}x$h)');
      });
    }
  }
}
