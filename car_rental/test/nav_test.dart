import 'package:car_rental/navbar/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navbar Page Testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home:NavBottompract()));

    expect(find.byIcon(Icons.compare_arrows), findsOneWidget);

  });
}
