// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_resend_email_verification_code_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResendEmailVerificationCodeInput
    _$ApiResendEmailVerificationCodeInputFromJson(Map<String, dynamic> json) =>
        ApiResendEmailVerificationCodeInput(
          json['email'] as String,
          $enumDecode(
              _$ApiUserVerificationCodeUseCaseEnumEnumMap, json['useCase']),
        );

Map<String, dynamic> _$ApiResendEmailVerificationCodeInputToJson(
        ApiResendEmailVerificationCodeInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'useCase': _$ApiUserVerificationCodeUseCaseEnumEnumMap[instance.useCase]!,
    };

const _$ApiUserVerificationCodeUseCaseEnumEnumMap = {
  ApiUserVerificationCodeUseCaseEnum.PASSWORD_RESET: 'PASSWORD_RESET',
  ApiUserVerificationCodeUseCaseEnum.EMAIL_VERIFICATION: 'EMAIL_VERIFICATION',
};
