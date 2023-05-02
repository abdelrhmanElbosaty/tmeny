import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/di/localizations_container.dart';
import 'authentication_localization.dart';

class AuthenticationLocalizer {
  AuthenticationLocalizer._();

  static AuthenticationLocalization get _localizer =>
      injector.get<LocalizationsContainer>().getLocalizations();

  // walkThrow
  static String get welcomeTo => _localizer.translate("welcomeTo");
  static String get descriptionSubText => _localizer.translate("descriptionSubText");
  static String get continueWithEmail => _localizer.translate("continueWithEmail");
  static String get continueWithGoogle => _localizer.translate("continueWithGoogle");
  static String get continueWithApple => _localizer.translate("continueWithApple");
  static String get continueWithFacebook => _localizer.translate("continueWithFacebook");
  static String get continueWithTwitter => _localizer.translate("continueWithTwitter");
  static String get viewCommunity => _localizer.translate("viewCommunity");

  static String get google => _localizer.translate("google");
  static String get apple => _localizer.translate("apple");
  static String get facebook => _localizer.translate("facebook");
  static String get twitter => _localizer.translate("twitter");


  // sign up
  static String get signUp => _localizer.translate("signUp");
  static String get signUpDescription => _localizer.translate("signUpDescription");
  static String get firstName => _localizer.translate("firstName");
  static String get firstNameHint => _localizer.translate("firstNameHint");
  static String get lastName => _localizer.translate("lastName");
  static String get lastNameHint => _localizer.translate("lastNameHint");
  static String get email => _localizer.translate("email");
  static String get emailHint => _localizer.translate("emailHint");
  static String get password => _localizer.translate("password");
  static String get passwordHint => _localizer.translate("passwordHint");
  static String get termsAndConditions => _localizer.translate("termsAndConditions");
  static String get and => _localizer.translate("and");
  static String get continuingAgreeText => _localizer.translate("continuingAgreeText");
  static String get privacyPolicy => _localizer.translate("privacyPolicy");
  static String get alreadyHaveAccount => _localizer.translate("alreadyHaveAccount");
  static String get login => _localizer.translate("login");


  // log in
  static String get sendVerificationCode => _localizer.translate("sendVerificationCode");
  static String get changePasswordDescription => _localizer.translate("changePasswordDescription");
  static String get newPassword => _localizer.translate("newPassword");
  static String get newPasswordHint => _localizer.translate("newPasswordHint");
  static String get confirmPasswordHint => _localizer.translate("confirmPasswordHint");
  static String get success => _localizer.translate("success");
  static String get yourPasswordChanged => _localizer.translate("yourPasswordChanged");
  static String get done => _localizer.translate("done");


  // email error messages
  static String get errorEmail => _localizer.translate("errorEmail");
  static String get errorEmailEmpty => _localizer.translate("errorEmailEmpty");
  static String get errorEmailCapitalCharacters => _localizer.translate("errorEmailCapitalCharacters");
  static String get emailHasSpace => _localizer.translate("emailHasSpace");

  // password error messages
  static String get errorPasswordEmpty => _localizer.translate("errorPasswordEmpty");
  static String get errorPassword => _localizer.translate("errorPassword");

  // first name and last name error message
  static String get errorFirstNameEmpty => _localizer.translate("errorFirstNameEmpty");
  static String get errorLastNameEmpty => _localizer.translate("errorLastNameEmpty");
  static String get nameIsRequired => _localizer.translate("nameIsRequired");
  static String get inValidName => _localizer.translate("inValidName");
  static String get nameLengthError => _localizer.translate("nameLengthError");


  // forget password and update password
  static String get forgetPassword => _localizer.translate("forgetPassword");
  static String get surePassword => _localizer.translate("surePassword");
  static String get changePassword => _localizer.translate("changePassword");
  static String get pleaseEnterYourPhone => _localizer.translate("pleaseEnterYourPhone");
  static String get dontHaveAnAccount => _localizer.translate("dontHaveAnAccount");

  // social login
  static String get failedToLoginWithApple => _localizer.translate("failedToLoginWithApple");
  static String get failedToGetUser => _localizer.translate("failedToGetUser");
  static String get failedToLoginWithFacebook => _localizer.translate("failedToLoginWithFacebook");
  static String get failedToLoginWithGoogle => _localizer.translate("failedToLoginWithGoogle");
  static String get invalidProviderIdError => _localizer.translate("invalidProviderIdError");
  static String get userCancelSocialLogin => _localizer.translate("userCancelSocialLogin");

}
