import 'package:domi/di.dart';
import 'package:domi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    configureDI();
  });
  group('end-to-end test', () {
    testWidgets('scenario: end-to-end', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      expect(find.text("Claim your Domi ID"), findsOne);

      expect(find.byType(TextFormField), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), "3");

      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text("Earn with your Domi ID"), findsOne);
    });
  });
}
