// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat_app/main.dart';

void main() {
  testWidgets('App renders either Chat or Login screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Wait for Firebase to initialize and auth stream to emit
    await tester.pump(const Duration(seconds: 2));

    // You can check for either:
    expect(find.textContaining('Chat'), findsWidgets); // ChatScreen title
    expect(find.textContaining('Sign in'), findsWidgets); // LoginScreen button
  });
}

