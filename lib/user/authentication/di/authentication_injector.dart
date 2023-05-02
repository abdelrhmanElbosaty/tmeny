
import 'package:tmeny_flutter/common/data/repositories/otp_repository_imp.dart';
import 'package:tmeny_flutter/common/domain/repositories/otp_repository.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/delete_otp_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/get_otp_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/handle_otp_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/set_opt_use_case.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/data/repository/user_authentication_repository_imp.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/email_verification/email_user_verification_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/email_verification/resend_verification_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/forget_password_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/user_update_password_usecase.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/verify_reset_password_verification_code_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/facebook_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/google_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/social_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/user_login_usecase.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_register/user_register_usecase.dart';

class UserAuthenticationDi {
  static Future<void> initialize() async {
    injector.registerFactory<OTPRepository>(() => OTPRepositoryImp(injector()));
    injector.registerFactory(() => SetOTPUseCase(injector()));
    injector.registerFactory(() => GetOTPUseCase(injector()));
    injector.registerFactory(() => DeleteOTPUseCase(injector()));
    injector.registerFactory(() => HandleOTPUseCase(
          injector(),
          injector(),
          injector(),
        ));

    // email verification
    injector.registerFactory(() => EmailUserVerificationUseCase(injector(),));
    injector.registerFactory(() => ResendVerificationUseCase(injector(),));
    injector.registerFactory(() => VerifyForgetPasswordVerificationCode(injector(),));
    injector.registerFactory(() => UserUpdatePasswordUseCase(injector(),));

    // user register
    injector.registerFactory<UserAuthenticationRepository>(
        () => UserAuthenticationRepositoryImp(injector(), injector()));
    injector.registerFactory(() => UserRegisterUseCase(injector()));
    injector.registerFactory(() => UserLoginUseCase(injector()));

    injector.registerFactory(() => ForgetPasswordUseCase(injector()));

    //social login
    injector.registerFactory(() => GoogleLoginUseCase(
      injector(),
      injector(),
    ));
    injector.registerFactory(() => FacebookLoginUseCase(injector(), injector()));
    injector.registerFactory(() => SocialLoginUseCase(injector()));

  }
}
