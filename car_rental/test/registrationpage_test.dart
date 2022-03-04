// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:hamro_flight/main.dart';
// import 'package:hamro_flight/screens/login/login_screen.dart';
// import 'package:hamro_flight/screens/registration/registration_screen.dart';

// void main() {

//   testWidgets('Login Screen Test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const LoginScreen());
//     final loginButton = find.byKey(const Key('loginButton'));
//     final usernameField = find.byKey(const Key('usernameField'));
//     final passwordField = find.byKey(const Key('passwordField'));

//     await tester.enterText(usernameField, 'subasha@techkraftinc.com');
//     await tester.enterText(passwordField, 'Sub@sh12');
//     await tester.tap(loginButton);

//     final advancedDrawer = find.byKey(const Key('advancedDrawer'));
//     expect(advancedDrawer, findsOneWidget);
//     print('Login Widget Test Successful');
//   });

//   testWidgets('Registration Screen Test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const RegistrationScreen());
//     final usernameField = find.byKey(const Key('usernameField'));
//     final phoneField = find.byKey(const Key('phoneField'));
//     final emailField = find.byKey(const Key('emailField'));
//     final passwordField = find.byKey(const Key('passwordField'));
//     final confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
//     final signUpButton = find.byKey(const Key('signUpButton'));

//     await tester.enterText(usernameField,DateTime.now().millisecondsSinceEpoch.toString());
//     await tester.enterText(phoneField, '+917001234567');
//     await tester.enterText(emailField, DateTime.now().millisecondsSinceEpoch.toString()+'@gmail.com');
//     await tester.enterText(passwordField, 'Sub@sh12');
//     await tester.enterText(confirmPasswordField, 'Sub@sh12');
//     await tester.tap(signUpButton);

//     final advancedDrawer = find.byKey(const Key('advancedDrawer'));
//     expect(advancedDrawer, findsOneWidget);
//     print('Signup Widget Test Successful');
//   });
// }
