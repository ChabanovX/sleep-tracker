import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sleep_tracker_app/main.dart';

// import 'package:sleep_tracker_app/models/timer.dart';

void main() {
  testWidgets('MainApp test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(child: MainApp()));

    // expect(true, true);
    expect(find.text("Time left before bed 😴"), findsOneWidget);
  });
}
