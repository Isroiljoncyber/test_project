import 'package:either_dart/src/either.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/features/auth/data/datasource/login_datasource.dart';
import 'package:test_project/features/auth/domain/entities/login_entity.dart';
import 'package:test_project/features/auth/domain/repositories/login_repository.dart';
import 'package:test_project/core/utils/excaptions.dart';

class LoginRepositoryImpl extends LoginRepository {
  final dataSource = serviceLocator<LoginDataSourceImpl>();

  @override
  Future<Either<ServerException, LoginEntity>> onLogin(params) async {
    try {
      final result = await dataSource.onLogin(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerException(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
