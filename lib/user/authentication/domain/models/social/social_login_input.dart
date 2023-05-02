import 'package:equatable/equatable.dart';

class SocialLoginInput extends Equatable {
  final String providerId;
  final SocialProvidersEnum provider;
  final String? userName;
  final String? photoUrl;
  final String? fcmToken;

  const SocialLoginInput({
    required this.photoUrl,
    required this.providerId,
    required this.userName,
    this.fcmToken,
    required this.provider,
  });

  @override
  List<Object?> get props =>
      [providerId, userName, fcmToken, provider, photoUrl];

  @override
  String toString() {
    return 'SocialLoginInput{providerId: $providerId, provider: $provider, userName: $userName, photoUrl: $photoUrl, fcmToken: $fcmToken}';
  }
}

enum SocialProvidersEnum {
  facebook,
  twitter,
  google,
  apple,
}
