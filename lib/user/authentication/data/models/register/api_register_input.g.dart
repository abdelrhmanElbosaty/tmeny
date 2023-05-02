// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_register_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRegisterInput _$ApiRegisterInputFromJson(Map<String, dynamic> json) =>
    ApiRegisterInput(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      device: $enumDecode(_$ApiDeviceEnumEnumMap, json['device']),
      fcmToken: json['fcmToken'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ApiRegisterInputToJson(ApiRegisterInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'device': _$ApiDeviceEnumEnumMap[instance.device]!,
      'fcmToken': instance.fcmToken,
      'lat': instance.lat,
      'long': instance.long,
    };

const _$ApiDeviceEnumEnumMap = {
  ApiDeviceEnum.DESKTOP: 'DESKTOP',
  ApiDeviceEnum.IOS: 'IOS',
  ApiDeviceEnum.ANDROID: 'ANDROID',
};
