import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
part 'api_verify_forget_password_verification_code_input.g.dart';

@JsonSerializable()
class ApiVerifyForgetPasswordVerificationCodeInput {
  final String email;
  final String code;

  factory ApiVerifyForgetPasswordVerificationCodeInput.fromJson(
          Map<String, dynamic> json) =>
      _$ApiVerifyForgetPasswordVerificationCodeInputFromJson(json);

  ApiVerifyForgetPasswordVerificationCodeInput(
      this.email, this.code);

  Map<String, dynamic> toJson() =>
      _$ApiVerifyForgetPasswordVerificationCodeInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiVerifyForgetPasswordVerificationCodeInput.fromApiVerifyForgetPasswordVerificationCodeInput(
      VerificationCodeInput input) {
    return ApiVerifyForgetPasswordVerificationCodeInput(
        input.email, input.verificationCode);
  }
}
