import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';

part 'tokens_model.g.dart';

@JsonSerializable()
class TokenModel extends TokenEntity {
  const TokenModel({
    super.accessToken,
    super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}

class TokenModelConverter implements JsonConverter<TokenEntity, Map<String, dynamic>> {
  const TokenModelConverter();

  @override
  TokenEntity fromJson(Map<String, dynamic> json) => TokenModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(TokenEntity object) => {};

}
