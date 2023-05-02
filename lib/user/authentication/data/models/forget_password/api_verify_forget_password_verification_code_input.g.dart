// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_verify_forget_password_verification_code_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiVerifyForgetPasswordVerificationCodeInput
    _$ApiVerifyForgetPasswordVerificationCodeInputFromJson(
            Map<String, dynamic> json) =>
        ApiVerifyForgetPasswordVerificationCodeInput(
          json['email'] as String,
          json['code'] as String,
        );

Map<String, dynamic> _$ApiVerifyForgetPasswordVerificationCodeInputToJson(
        ApiVerifyForgetPasswordVerificationCodeInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
