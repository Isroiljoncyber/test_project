import 'package:either_dart/either.dart';
import 'package:test_project/features/auth/domain/entities/login_entity.dart';
import 'package:test_project/core/utils/excaptions.dart';

abstract class LoginRepository {
  Future<Either<ServerException, LoginEntity>> onLogin(params);
}
