import 'package:dio/dio.dart';
import 'package:test_project/assets/constants/app_consts.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/singleton/dio.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/core/utils/excaptions.dart';
import 'package:test_project/features/auth/data/models/login_model.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

abstract class LoginDataSource {
  Future<LoginModel> onLogin(UserCredentials credentials);
}

class LoginDataSourceImpl extends LoginDataSource {
  final Dio dio = serviceLocator<DioSettings>().dio();

  @override
  Future<LoginModel> onLogin(UserCredentials credentials) async {
    try {
      Map<String, dynamic> body = {
        "email": credentials.mail,
        "password": credentials.password,
      };
      final response = await dio.post(
        '/api/v1/auth/login',
        data: body,
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return LoginModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode ?? 400,
          errorMessage: response.data['message'],
        );
      }
    } on ServerException catch (e) {
      throw ServerException(
        statusCode: e.statusCode,
        errorMessage: e.errorMessage,
      );
    }
  }
}
