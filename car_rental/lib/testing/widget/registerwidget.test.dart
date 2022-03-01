import 'package:car_rental/screen/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Change My Home Page Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const RegisterScreen());
  });
}
