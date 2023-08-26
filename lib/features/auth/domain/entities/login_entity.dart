import 'package:equatable/equatable.dart';
import 'package:test_project/features/auth/data/models/tokens_model.dart';
import 'package:test_project/features/auth/data/models/user_detail_model.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_detail_entity.dart';

class LoginEntity extends Equatable {
  @TokenModelConverter()
  final TokenEntity tokens;

  @UserDetailModelConverter()
  final UserDetailEntity user;

  const LoginEntity({
    this.tokens = const TokenEntity(),
    this.user = const UserDetailEntity(),
  });

  @override
  List<Object?> get props => [
        tokens,
        user,
      ];
}
