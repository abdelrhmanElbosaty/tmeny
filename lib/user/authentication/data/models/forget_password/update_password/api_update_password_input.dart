import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';
part 'api_update_password_input.g.dart';

@JsonSerializable()
class ApiUpdatePasswordInput {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String code;

  ApiUpdatePasswordInput({
    required this.newPassword,
    required this.confirmPassword,
    required this.code,
    required this.email,
  });

  factory ApiUpdatePasswordInput.fromJson(Map<String, dynamic> json) =>
      _$ApiUpdatePasswordInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUpdatePasswordInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiUpdatePasswordInput.fromApiUpdatePasswordInput(
      UserUpdatePasswordInput input) {
    return ApiUpdatePasswordInput(
      email: input.email,
      code: input.code,
      confirmPassword: input.confirmPassword,
      newPassword: input.newPassword,
    );
  }
}
