import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/common/domain/models/device.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
part 'api_social_login_input.g.dart';

@JsonSerializable()
class ApiSocialLoginInput {
  final String providerId;
  final ApiSocialProvidersEnum provider;
  final ApiDeviceEnum device;
  final String? email;
  final String? fcmToken;

  factory ApiSocialLoginInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSocialLoginInputFromJson(json);

  factory ApiSocialLoginInput.fromInput(SocialLoginInput input) {
    final ApiDeviceEnum deviceEnum = getDeviceType();
    final ApiSocialProvidersEnum provider =
        getApiSocialProvider(input.provider);
    return ApiSocialLoginInput(
      providerId: input.providerId,
      provider: provider,
      device: deviceEnum,
      fcmToken: input.fcmToken,
    );
  }

  ApiSocialLoginInput(
      {required this.providerId,
      required this.provider,
      required this.device,
      this.email,
      this.fcmToken});

  Map<String, dynamic> toJson() => _$ApiSocialLoginInputToJson(this);

  Map<String, dynamic> toJsonWithoutNulls() {
    final Map<String, dynamic> filteredJson = {};
    toJson().forEach((key, value) {
      if (value != null) {
        filteredJson[key] = value;
      }
    });
    return filteredJson;
  }
}

enum ApiSocialProvidersEnum { FACEBOOK, TWITTER, GOOGLE, APPLE }

ApiSocialProvidersEnum getApiSocialProvider(
    SocialProvidersEnum socialProvidersEnum) {
  switch (socialProvidersEnum) {
    case SocialProvidersEnum.google:
      return ApiSocialProvidersEnum.GOOGLE;
    case SocialProvidersEnum.apple:
      return ApiSocialProvidersEnum.APPLE;
    case SocialProvidersEnum.facebook:
      return ApiSocialProvidersEnum.FACEBOOK;
    case SocialProvidersEnum.twitter:
      return ApiSocialProvidersEnum.TWITTER;
  }
}
