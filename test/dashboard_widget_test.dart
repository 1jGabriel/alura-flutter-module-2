import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Should display the main image when the dashboard is opened',
    (tester) async {
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      final mainImage = find.byType(Image);
      expect(mainImage, findsOneWidget);
    },
  );

  testWidgets(
    'Should display the first feature when the dashboard is opened',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      final mainImage = find.byType(FeatureItem);
      expect(mainImage, findsWidgets);
    },
  );

}
