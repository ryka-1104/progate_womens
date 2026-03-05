// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:progate_womens/main.dart';

void main() {
  testWidgets('Bottom navigation switches between 3 screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('ホーム画面'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.photo_camera));
    await tester.pump();
    expect(find.text('QRコードを読み取ってください'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();
    expect(find.text('リスト項目 1'), findsOneWidget);
  });
}
