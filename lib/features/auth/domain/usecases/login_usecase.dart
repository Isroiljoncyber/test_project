import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/utils/base_usecase.dart';
import 'package:test_project/features/auth/data/repositories/login_repo_impl.dart';
import 'package:test_project/core/utils/excaptions.dart';
import 'package:test_project/features/auth/domain/entities/login_entity.dart';
import 'package:test_project/features/auth/domain/repositories/login_repository.dart';

class LoginUseCase extends UseCase<LoginEntity, UserCredentials> {
  final LoginRepository loginRepo = serviceLocator<LoginRepositoryImpl>();

  @override
  Future<Either<ServerException, LoginEntity>> call(UserCredentials params) async {
    return await loginRepo.onLogin(params);
  }
}

class UserCredentials extends Equatable {
  final String mail;
  final String password;

  const UserCredentials({required this.mail, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
