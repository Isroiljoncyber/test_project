import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

void main() {
  test(
    "Login with correct user credentials",
    () async {
      setupDependency();
      final result = await LoginUseCase().call(
        const UserCredentials(mail: 'maripbekoff@gmail.com', password: 'adminadmin'),
      );
      if (result.isRight) {
        expect(result.right.user.nickname, "maripbekoff");
      } else {
        expect(result.left, throwsException);
      }
    },
  );
  test(
    "Login with incorrect password credentials ",
    () async {
      final result = await LoginUseCase().call(
        const UserCredentials(mail: 'maripbekoff@gmail.com', password: 'randomPassword'),
      );
      if (result.isLeft) {
        expect(result.left.errorMessage, 'Email or password is not correct!');
      } else {
        expect(result.right, throwsException);
      }
    },
  );
  test(
    "User tokens are coming correctly",
    () async {
      final result = await LoginUseCase().call(
        const UserCredentials(mail: 'maripbekoff@gmail.com', password: 'adminadmin'),
      );
      if (result.isRight) {
        expect(result.right.tokens.accessToken.isNotEmpty, true);
      } else {
        expect(result.left, throwsException);
      }
    },
  );
}
