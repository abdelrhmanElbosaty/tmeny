

import 'package:tmeny_flutter/common/utils/localization/common_localization.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/di/localizations_container.dart';

class CommonLocalizer {
  CommonLocalizer._();
  static CommonLocalization get _localizer =>
      injector.get<LocalizationsContainer>().getLocalizations();

  // errors messages
  static String get tryAgain => _localizer.translate("tryAgain");
  static String get networkError => _localizer.translate("networkError");
  static String get serverError => _localizer.translate("serverError");
  static String get unexpectedError => _localizer.translate("unexpectedError");
  static String get somethingWentWrong => _localizer.translate("somethingWentWrong");
  static String get noValuesError => _localizer.translate("noValuesError");
  static String get noInternetConnection => _localizer.translate("noInternetConnection");
  static String get hasInternetConnection => _localizer.translate("hasInternetConnection");
  static String get otpBlocked => _localizer.translate("otpBlocked");

  // PrettyDateExtensions
  static String get sinceDate => _localizer.translate("sinceDate");
  static String get justNow => _localizer.translate("justNow");
  static String get day => _localizer.translate("day");
  static String get week => _localizer.translate("week");
  static String get minute => _localizer.translate("minute");
  static String get hour => _localizer.translate("hour");

  // email verification and password reset ( OTP )
  static String get emailVerification => _localizer.translate("emailVerification");
  static String get changePassword => _localizer.translate("changePassword");
  static String get codeThatWasSent => _localizer.translate("codeThatWasSent");
  static String get resendVerificationCode => _localizer.translate("resendVerificationCode");
  static String get inCorrectOTPMessage => _localizer.translate("inCorrectOTPMessage");
  static String get yourPasswordChanged => _localizer.translate("yourPasswordChanged");

  // other common localization
  static String get noImageFound => _localizer.translate("noImageFound");
  static String get previewImage => _localizer.translate("previewImage");
  static String get success => _localizer.translate("success");
  static String get changeLanguage => _localizer.translate("changeLanguage");
  static String get logOut => _localizer.translate("logOut");


  // buttons localization
  static String get next => _localizer.translate("next");
  static String get skip => _localizer.translate("skip");
  static String get verify => _localizer.translate("verify");
  static String get done => _localizer.translate("done");
  static String get continueText => _localizer.translate("continue");
  static String get confirm => _localizer.translate("confirm");
  static String get addLink => _localizer.translate("addLink");
  static String get remove => _localizer.translate("remove");
  static String get ok => _localizer.translate("ok");
  static String get cancel => _localizer.translate("cancel");
  static String get deleteAccount => _localizer.translate("deleteAccount");
  static String get send => _localizer.translate("send");


}