import 'package:car_rental/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextField Testing', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home:RegisterScreen()));

    expect(find.text("Register Page"), findsOneWidget);

  });
} 
