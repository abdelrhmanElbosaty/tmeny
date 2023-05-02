import 'package:json_annotation/json_annotation.dart';
part 'api_forget_password_input.g.dart';

@JsonSerializable()
class ApiForgetPasswordInput {
  final String email;

  ApiForgetPasswordInput({
    required this.email,
  });

  factory ApiForgetPasswordInput.fromJson(Map<String, dynamic> json) =>
      _$ApiForgetPasswordInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiForgetPasswordInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiForgetPasswordInput.fromForgetPasswordInput(String email) {
    return ApiForgetPasswordInput(
      email: email,
    );
  }
}

