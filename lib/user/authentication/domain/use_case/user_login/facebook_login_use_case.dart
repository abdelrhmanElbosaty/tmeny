import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/common/domain/use_cases/fcm_token_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/social_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class FacebookLoginUseCase {
  final SocialLoginUseCase _socialLoginUseCase;
  final FcmTokenUseCase _fcmTokenUseCase;

  FacebookLoginUseCase(
      this._socialLoginUseCase,
      this._fcmTokenUseCase,
      );

  Future<void> execute() async {
    final result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        return await _handleLoginSuccess(result.accessToken);
      case LoginStatus.cancelled:
        throw ApiRequestException(StatusCodes.userCancelledSocialLogin, AuthenticationLocalizer.userCancelSocialLogin);
      case LoginStatus.failed:
      case LoginStatus.operationInProgress:
        throw ApiRequestException(
          StatusCodes.failedToLoginWithFacebook,
          AuthenticationLocalizer.failedToLoginWithFacebook,
        );
    }
  }

  Future<void> _handleLoginSuccess(AccessToken? accessToken) async {
    if (accessToken != null) {
      final userJson = await FacebookAuth.instance.getUserData();
      final String? id = userJson["id"];
      final String? name = userJson["name"];
      final String? profilePicture = userJson["picture"]["data"]["url"];

      final fcmToken = await _fcmTokenUseCase.execute();

      final socialInput = SocialLoginInput(
        photoUrl: profilePicture,
        providerId: id ?? "",
        userName: name ?? "",
        fcmToken: fcmToken,
        provider: SocialProvidersEnum.facebook,
      );
      _socialLoginUseCase.execute(socialInput);
      // await _cacheUser(loggedUser);
      // return SocialInfo(
      //     socialInput.userName, loggedUser.token.isCompleteRegister);
    // }else{
    //   Todo("handle Exception here maybe you will use ApiRequestException")
      // throw Exception("accessToken is null");
    }
  }
}
