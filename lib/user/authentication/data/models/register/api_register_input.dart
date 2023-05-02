import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/common/domain/models/device.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
part 'api_register_input.g.dart';

@JsonSerializable()
class ApiRegisterInput {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final ApiDeviceEnum device;
  final String? fcmToken;
  final double? lat;
  final double? long;

  factory ApiRegisterInput.fromJson(Map<String, dynamic> json) =>
      _$ApiRegisterInputFromJson(json);

  ApiRegisterInput({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.device,
    this.fcmToken,
    this.lat,
    this.long,
  });

  Map<String, dynamic> toJson() => _$ApiRegisterInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }

  factory ApiRegisterInput.fromRegisterInput(UserRegisterInput input) {
    final ApiDeviceEnum deviceEnum = getDeviceType();
    return ApiRegisterInput(
      email: input.emailAddress,
      firstName: input.firstName,
      lastName: input.lastName,
      password: input.password,
      device: deviceEnum,
    );
  }
}

