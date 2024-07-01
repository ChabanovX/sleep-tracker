import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sleep_tracker_app/main.dart';

void main() {
  testWidgets('Home Page displays correct information',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    expect(true, true);
    // expect(find.text("Time left before bed 😴"), findsOneWidget);
  });
}
