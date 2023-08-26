import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/domain/entities/user_detail_entity.dart';

part 'user_detail_model.g.dart';

@JsonSerializable()
class UserDetailModel extends UserDetailEntity {
  const UserDetailModel({
    super.email,
    super.id,
    super.nickname,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);
}

class UserDetailModelConverter implements JsonConverter<UserDetailEntity, Map<String, dynamic>> {
  const UserDetailModelConverter();

  @override
  UserDetailEntity fromJson(Map<String, dynamic> json) => UserDetailModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(UserDetailEntity object) => {};
}
