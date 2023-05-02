// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_update_password_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUpdatePasswordInput _$ApiUpdatePasswordInputFromJson(
        Map<String, dynamic> json) =>
    ApiUpdatePasswordInput(
      newPassword: json['newPassword'] as String,
      confirmPassword: json['confirmPassword'] as String,
      code: json['code'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ApiUpdatePasswordInputToJson(
        ApiUpdatePasswordInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
      'code': instance.code,
    };
