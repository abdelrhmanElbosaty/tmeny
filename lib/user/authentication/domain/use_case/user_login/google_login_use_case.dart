import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/common/domain/use_cases/fcm_token_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/social_login_use_case.dart';
import '../../../utils/localization/authentication_localizer.dart';

class GoogleLoginUseCase {
  final SocialLoginUseCase _socialLoginUseCase;
  final FcmTokenUseCase _fcmTokenUseCase;

  GoogleLoginUseCase(
    this._socialLoginUseCase,
    this._fcmTokenUseCase,
  );

  Future<void> execute() async {
    final googleSignIn = GoogleSignIn(
      scopes: [
        "email",
        "profile",
      ],
    );

    try {
      final result = await googleSignIn.signIn();
      if (result != null) {
        await _handleLoginSuccess(result);
      } else {
        throw ApiRequestException(
            StatusCodes.userCancelledSocialLogin, AuthenticationLocalizer.userCancelSocialLogin);
      }
    } on PlatformException catch (e) {
      if (e.code == GoogleSignIn.kSignInFailedError) {
        throw ApiRequestException(
          StatusCodes.failedToLoginWithGoogle,
          AuthenticationLocalizer.failedToLoginWithGoogle,
        );
      } else {
        rethrow;
      }
    }
  }

  Future<void> _handleLoginSuccess(GoogleSignInAccount account) async {
    // final fcmToken = await _fcmTokenUseCase.execute();
    final socialInput = SocialLoginInput(
        providerId: account.id,
        userName: account.displayName,
        // fcmToken: fcmToken,
        provider: SocialProvidersEnum.google,
        photoUrl: account.photoUrl);
    await _socialLoginUseCase.execute(socialInput);
  }
}
