// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      tokens: json['tokens'] == null
          ? const TokenEntity()
          : const TokenModelConverter()
              .fromJson(json['tokens'] as Map<String, dynamic>),
      user: json['user'] == null
          ? const UserDetailEntity()
          : const UserDetailModelConverter()
              .fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'tokens': const TokenModelConverter().toJson(instance.tokens),
      'user': const UserDetailModelConverter().toJson(instance.user),
    };
