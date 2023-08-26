import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:test_project/assets/constants/app_consts.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/features/auth/domain/entities/login_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_detail_entity.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<InitialEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    LoginUseCase loginUseCase = LoginUseCase();
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
      var result = await loginUseCase(UserCredentials(mail: event.mail, password: event.password));
      if (result.isRight) {
        StorageRepository.putString(AppConstants.token, result.right.tokens.accessToken);
        StorageRepository.putString(AppConstants.nickName, result.right.user.nickname);
        StorageRepository.putString(AppConstants.email, result.right.user.email);
        emit(state.copyWith(
          loginStatus: FormzSubmissionStatus.success,
          loginEntity: result.right,
        ));
        event.onSuccess();
      } else {
        emit(state.copyWith(
          loginStatus: FormzSubmissionStatus.failure,
          errorMessage: result.left.errorMessage,
        ));
      }
    });
    on<EnterEvent>(
      (event, emit) {
        var nickName =StorageRepository.getString(AppConstants.nickName, defValue: '');
        var email =StorageRepository.getString(AppConstants.email, defValue: '');
        emit(state.copyWith(
          loginEntity: LoginEntity(user: UserDetailEntity(email: email, nickname: nickName)),
          loginStatus: FormzSubmissionStatus.success,
        ));
      },
    );
    on<LogOutEvent>(
      (event, emit) {
        StorageRepository.deleteString(AppConstants.token);
        StorageRepository.deleteString(AppConstants.nickName);
        StorageRepository.deleteString(AppConstants.email);
        event.onSuccess();
      },
    );
    on<LoginSubmitting>(
      (event, emit) {
        emit(state.copyWith(login: event.login, loginStatus: FormzSubmissionStatus.initial));
      },
    );
    on<PasswordSubmitting>(
      (event, emit) {
        emit(state.copyWith(password: event.password, loginStatus: FormzSubmissionStatus.initial));
      },
    );
  }
}
