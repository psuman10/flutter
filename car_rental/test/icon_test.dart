
import 'package:car_rental/screen/tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Register Page Testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home:BookingConfirmation()));

    expect(find.byIcon(Icons.check), findsOneWidget);

  });
}
