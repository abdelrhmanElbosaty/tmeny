import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
part 'api_resend_email_verification_code_input.g.dart';

@JsonSerializable()
class ApiResendEmailVerificationCodeInput {
  final String email;
  final ApiUserVerificationCodeUseCaseEnum useCase;

  factory ApiResendEmailVerificationCodeInput.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResendEmailVerificationCodeInputFromJson(json);

  ApiResendEmailVerificationCodeInput(this.email, this.useCase);

  Map<String, dynamic> toJson() =>
      _$ApiResendEmailVerificationCodeInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiResendEmailVerificationCodeInput.fromApiResendEmailVerificationCodeInput(
      EmailVerificationCodeInput input) {
    final ApiUserVerificationCodeUseCaseEnum useCaseEnum =
        getUserVerificationCodeUseCaseEnum(input.verificationUsage);
    return ApiResendEmailVerificationCodeInput(input.email, useCaseEnum);
  }
}

ApiUserVerificationCodeUseCaseEnum getUserVerificationCodeUseCaseEnum(
    VerificationUsage usage) {
  switch (usage) {
    case VerificationUsage.emailVerification:
      return ApiUserVerificationCodeUseCaseEnum.EMAIL_VERIFICATION;
    case VerificationUsage.passwordReset:
      return ApiUserVerificationCodeUseCaseEnum.PASSWORD_RESET;
  }
}

enum ApiUserVerificationCodeUseCaseEnum { PASSWORD_RESET, EMAIL_VERIFICATION }
