import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test multiple email values', () {
    test('Single name is not an email', () {
      expect('test', true);
    });
  });
}
