// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLoginInput _$ApiLoginInputFromJson(Map<String, dynamic> json) =>
    ApiLoginInput(
      email: json['email'] as String,
      password: json['password'] as String,
      device: $enumDecode(_$ApiDeviceEnumEnumMap, json['device']),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ApiLoginInputToJson(ApiLoginInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
      'device': _$ApiDeviceEnumEnumMap[instance.device]!,
    };

const _$ApiDeviceEnumEnumMap = {
  ApiDeviceEnum.DESKTOP: 'DESKTOP',
  ApiDeviceEnum.IOS: 'IOS',
  ApiDeviceEnum.ANDROID: 'ANDROID',
};
