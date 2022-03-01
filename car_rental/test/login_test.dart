import 'package:car_rental/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Page Testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));

    expect(find.text("Login Screen"), findsOneWidget);

  });
}
