import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
part 'api_email_user_register_verification_input.g.dart';

@JsonSerializable()
class ApiEmailRegisterVerificationInput {
  final String email;
  final String verificationCode;


  factory ApiEmailRegisterVerificationInput.fromJson(Map<String, dynamic> json) =>
      _$ApiEmailRegisterVerificationInputFromJson(json);

  ApiEmailRegisterVerificationInput(this.email, this.verificationCode);

  Map<String, dynamic> toJson() => _$ApiEmailRegisterVerificationInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiEmailRegisterVerificationInput.fromEmailRegisterVerificationInput(VerificationCodeInput input) {
    return ApiEmailRegisterVerificationInput(
     input.email, input.verificationCode
    );
  }
}