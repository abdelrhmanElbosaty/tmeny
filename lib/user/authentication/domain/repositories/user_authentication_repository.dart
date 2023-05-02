

import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';

abstract class UserAuthenticationRepository {
  Future<bool> userRegister(UserRegisterInput input);

  Future<CachedUserData> userLogin(UserLoginInput input);

  Future<CachedUserData> socialLogin(SocialLoginInput input);

  Future<CachedUserData> getCacheUserData(UserRegisterInput input);

  Future<CachedUserData> registerVerification(
      VerificationCodeInput input);

  Future<bool> resendEmailVerificationCode(EmailVerificationCodeInput input);

  Future<bool> forgetPassword(String email);

  Future<bool> verifyForgetPasswordVerificationCode(VerificationCodeInput input);

  Future<CachedUserData> updatePassword(UserUpdatePasswordInput input);
}
