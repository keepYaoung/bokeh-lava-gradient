// TEMPORARY generator — renders the pub.dev screenshot/thumbnail to
// screenshots/thumbnail.png. Excluded from the package via .pubignore.
//
// The gradient is rendered by Flutter; the wordmark is composited with the
// `image` package (flutter_test has no real fonts, so Text() renders as boxes).
//
//   flutter test test/gen_thumb_test.dart

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

import 'package:bokeh_lava_gradient/bokeh_lava_gradient.dart';

void main() {
  const side = 1080;
  const dpr = 1.0;

  testWidgets('generate thumbnail', (tester) async {
    tester.view.physicalSize = Size(side.toDouble(), side.toDouble());
    tester.view.devicePixelRatio = dpr;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final key = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepaintBoundary(
          key: key,
          child: SizedBox(
            width: side.toDouble(),
            height: side.toDouble(),
            child: BokehLavaGradient.preset(BokehTheme.og),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump(const Duration(milliseconds: 300));

    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    late Uint8List rgba;
    await tester.runAsync(() async {
      final image = await boundary.toImage(pixelRatio: dpr);
      final bd = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      rgba = bd!.buffer.asUint8List();
      image.dispose();
    });

    final canvas = img.Image.fromBytes(
      width: side,
      height: side,
      bytes: rgba.buffer,
      numChannels: 4,
      order: img.ChannelOrder.rgba,
    );

    // Solid dark footer band for strong contrast, then crisp white wordmark.
    final white = img.ColorRgba8(255, 255, 255, 255);
    final faint = img.ColorRgba8(255, 236, 220, 235);
    img.Image label(String s, img.BitmapFont font, img.Color color) {
      final tmp = img.Image(
          width: s.length * font.base + 40, height: 90, numChannels: 4);
      img.drawString(tmp, s, font: font, x: 0, y: 18, color: color);
      return img.trim(tmp);
    }

    final title = label('bokeh_lava_gradient', img.arial48, white);
    final sub = label('flutter  -  bokeh / lava gradient background',
        img.arial24, faint);

    // deep-burnt footer band (matches the og palette)
    img.fillRect(canvas,
        x1: 0,
        y1: side - 230,
        x2: side,
        y2: side,
        color: img.ColorRgba8(74, 27, 12, 255));

    img.compositeImage(canvas, title,
        dstX: (side - title.width) ~/ 2, dstY: side - 175);
    img.compositeImage(canvas, sub,
        dstX: (side - sub.width) ~/ 2, dstY: side - 95);

    final png = img.encodePng(canvas);
    Directory('screenshots').createSync(recursive: true);
    File('screenshots/thumbnail.png').writeAsBytesSync(png);
    // ignore: avoid_print
    print('wrote screenshots/thumbnail.png  '
        '(${png.length ~/ 1024} KB, ${side}x$side)');
  });
}
