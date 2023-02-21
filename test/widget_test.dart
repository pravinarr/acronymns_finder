// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:acronyms_finder/services/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acronyms_finder/main.dart';

void main() {
  testWidgets('Check for text field present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key('search_field')), findsOneWidget);
  });

  //This test case would fail. Need to add http mocks
  testWidgets('Check for search results', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byKey(const Key('search_field')), 'cpu');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('5 results'), findsOneWidget);
  });
}
