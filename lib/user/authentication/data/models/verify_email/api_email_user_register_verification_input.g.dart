// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_email_user_register_verification_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEmailRegisterVerificationInput _$ApiEmailRegisterVerificationInputFromJson(
        Map<String, dynamic> json) =>
    ApiEmailRegisterVerificationInput(
      json['email'] as String,
      json['verificationCode'] as String,
    );

Map<String, dynamic> _$ApiEmailRegisterVerificationInputToJson(
        ApiEmailRegisterVerificationInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationCode': instance.verificationCode,
    };
