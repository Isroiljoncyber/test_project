import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/data/models/tokens_model.dart';
import 'package:test_project/features/auth/domain/entities/login_entity.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_detail_entity.dart';

import 'user_detail_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginEntity {
  const LoginModel({
    super.tokens,
    super.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}
