import 'package:flutter_test/flutter_test.dart';

import 'package:bokeh_lava_gradient/main.dart';

void main() {
  testWidgets('demo builds and shows mode toggle', (tester) async {
    await tester.pumpWidget(const DemoApp());
    await tester.pump();
    expect(find.text('Bokeh Lava'), findsOneWidget);
    expect(find.text('Mesh'), findsOneWidget);
  });
}
