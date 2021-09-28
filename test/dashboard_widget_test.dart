import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers.dart';
import 'mocks.dart';


// steps :
// 1 - pump widget
// 2 - find widget expected
// 3 - assert wih findsOneWidget

void main() {
  testWidgets('Should display the main image when the Dashboard is opended',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard
          (contactDao :MockContactDao())));
        final mainImage = find.byType(Image);
        expect(mainImage, findsOneWidget);
      });
  testWidgets(
      'Should display the transfer feature when the Dashboard is opened',
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard(contactDao :MockContactDao())));
        final transferFeatureItem = find.byWidgetPredicate((widget) =>
            featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
        expect(transferFeatureItem, findsOneWidget);
      });
  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard(contactDao :MockContactDao())));
        final transactionFeedFeatureItem = find.byWidgetPredicate((widget) =>
            featureItemMatcher(widget, 'Transaction Feed', Icons.description));
        expect(transactionFeedFeatureItem, findsOneWidget);
      });
}
