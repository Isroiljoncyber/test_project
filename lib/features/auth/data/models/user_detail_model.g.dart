// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      email: json['email'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      nickname: json['nickname'] as String? ?? '',
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
    };
