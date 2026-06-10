import 'package:flutter_test/flutter_test.dart';

import 'package:bokeh_lava_gradient/main.dart';

void main() {
  testWidgets('demo builds and shows the 4 preset tabs', (tester) async {
    await tester.pumpWidget(const DemoApp());
    await tester.pump();
    expect(find.text('Light 1'), findsWidgets);
    expect(find.text('Dark 2'), findsWidgets);
  });
}
