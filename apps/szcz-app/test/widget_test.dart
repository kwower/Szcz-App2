// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:toothbrush_app/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows the repair gallery and empty state', (tester) async {
    await tester.pumpWidget(const ToothbrushApp());
    await tester.pumpAndSettle();

    expect(find.text('Galeria Szczoteczek'), findsOneWidget);
    expect(find.text('Łącznie naprawionych szczoteczek'), findsOneWidget);
    expect(find.text('Brak zapisanych szczoteczek'), findsOneWidget);
  });
}
