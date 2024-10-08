import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {
      print('Here');
    },
  );

  group(
    'User login full test',
    () {
      test(
        'User login success test',
        () {
          const isLogin = true;
          expect(isLogin, isTrue);
        },
      );

      test(
        'User login failed test',
        () {
          const isLogin = false;
          expect(isLogin, isFalse);
        },
      );
    },
  );
}
