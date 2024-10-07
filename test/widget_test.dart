// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:domi/di.dart';
import 'package:domi/views/address_picker/address_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    configureDI();
  });

  tearDownAll(() {});
  testWidgets('AddressPickerView widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: AddressPickerView())));

    // Check if title match
    expect(find.text("Claim your Domi ID"), findsOne);

    // Check if text field exist
    expect(find.byType(TextFormField), findsOne, skip: false);
  });
}
