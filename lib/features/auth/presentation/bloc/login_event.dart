part of 'login_bloc.dart';

abstract class InitialEvent {}

class LoginEvent extends InitialEvent {
  final String mail;
  final String password;
  final Function() onSuccess;

  LoginEvent(
    this.mail,
    this.password,
    this.onSuccess,
  );
}

class LoginSubmitting extends InitialEvent {
  final String login;

  LoginSubmitting(this.login);
}

class PasswordSubmitting extends InitialEvent {
  final String password;

  PasswordSubmitting(this.password);
}

class EnterEvent extends InitialEvent {}

class LogOutEvent extends InitialEvent {
  final Function() onSuccess;

  LogOutEvent(this.onSuccess);
}
