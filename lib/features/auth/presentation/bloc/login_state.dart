part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzSubmissionStatus loginStatus;
  final LoginEntity loginEntity;
  final String login;
  final String password;
  final String errorMessage;

  const LoginState({
    this.loginStatus = FormzSubmissionStatus.initial,
    this.loginEntity = const LoginEntity(),
    this.login = '',
    this.password = '',
    this.errorMessage = '',
  });

  copyWith({
    FormzSubmissionStatus? loginStatus,
    LoginEntity? loginEntity,
    String? login,
    String? password,
    String? errorMessage,
  }) =>
      LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        loginEntity: loginEntity ?? this.loginEntity,
        login: login ?? this.login,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        loginStatus,
        loginEntity,
        login,
        password,
        errorMessage,
      ];
}
