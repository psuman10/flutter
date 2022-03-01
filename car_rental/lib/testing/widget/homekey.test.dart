import 'dart:math';

import 'package:car_rental/screen/login.dart';
import 'package:car_rental/screen/main_screen.dart';
import 'package:car_rental/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Change My Home Page Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const Home());

    expect(find.text('LoginScreen'), findsOneWidget);
    expect(find.text('RegisterScreen'), findsNothing);
    expect(find.byKey(ValueKey('KEY_COMFIRM_PASSWORD')), findsNothing);
  });
}
