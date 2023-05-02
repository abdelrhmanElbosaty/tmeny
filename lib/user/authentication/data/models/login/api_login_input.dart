import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/common/domain/models/device.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
part 'api_login_input.g.dart';

@JsonSerializable()
class ApiLoginInput {
  final String email;
  final String password;
  final String? fcmToken;
  final ApiDeviceEnum device;

  ApiLoginInput({
    required this.email,
    required this.password,
    required this.device,
    this.fcmToken,
  });

  factory ApiLoginInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLoginInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiLoginInput.fromLoginInput(UserLoginInput input) {
    final ApiDeviceEnum deviceEnum = getDeviceType();
    return ApiLoginInput(
      email: input.email,
      password: input.password,
      device: deviceEnum,
    );
  }
}

