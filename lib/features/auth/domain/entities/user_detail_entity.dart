import 'package:equatable/equatable.dart';

class UserDetailEntity extends Equatable {
  final int id;

  final String email;

  final String nickname;

  const UserDetailEntity({
    this.id = -1,
    this.email = '',
    this.nickname = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        nickname,
      ];
}
