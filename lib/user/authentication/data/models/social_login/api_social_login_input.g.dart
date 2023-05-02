// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_social_login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSocialLoginInput _$ApiSocialLoginInputFromJson(Map<String, dynamic> json) =>
    ApiSocialLoginInput(
      providerId: json['providerId'] as String,
      provider: $enumDecode(_$ApiSocialProvidersEnumEnumMap, json['provider']),
      device: $enumDecode(_$ApiDeviceEnumEnumMap, json['device']),
      email: json['email'] as String?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ApiSocialLoginInputToJson(
        ApiSocialLoginInput instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'provider': _$ApiSocialProvidersEnumEnumMap[instance.provider]!,
      'device': _$ApiDeviceEnumEnumMap[instance.device]!,
      'email': instance.email,
      'fcmToken': instance.fcmToken,
    };

const _$ApiSocialProvidersEnumEnumMap = {
  ApiSocialProvidersEnum.FACEBOOK: 'FACEBOOK',
  ApiSocialProvidersEnum.TWITTER: 'TWITTER',
  ApiSocialProvidersEnum.GOOGLE: 'GOOGLE',
  ApiSocialProvidersEnum.APPLE: 'APPLE',
};

const _$ApiDeviceEnumEnumMap = {
  ApiDeviceEnum.DESKTOP: 'DESKTOP',
  ApiDeviceEnum.IOS: 'IOS',
  ApiDeviceEnum.ANDROID: 'ANDROID',
};
