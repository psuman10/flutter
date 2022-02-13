import 'package:car_rental/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  test('Registrating the user', () async {
    //setup

    //run

    //verify

    final user = User(
        username: 'psuman9840',
        password: '12345678',
        gender: 'male',
        email: 'sp55454040@gmail.com');

    test('empty email returns error string', () {
      var result = EmailValidator(errorText: '');
    });
  });
}
