
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'api_logout_input.g.dart';

@JsonSerializable()
class ApiLogoutInput {
  final DeviceEnum device;

  ApiLogoutInput(this.device);

  factory ApiLogoutInput.fromJson(Map<String, dynamic> json) => _$ApiLogoutInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLogoutInputToJson(this);
}

DeviceEnum getDeviceType() {
  if (Platform.isAndroid) {
    return DeviceEnum.ANDROID;
  } else if (Platform.isIOS) {
    return DeviceEnum.IOS;
  } else {
    return DeviceEnum.DESKTOP;
  }
}

enum DeviceEnum {
  DESKTOP,
  IOS,
  ANDROID,
}