import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/base/localization/app_localization.dart';

class AuthenticationLocalization extends AppLocalizations {
  AuthenticationLocalization(Locale locale) : super(locale);

  static const LocalizationsDelegate<AuthenticationLocalization> delegate =
      _AuthenticationLocalizationDelegate();

  @override
  String getLocalizationPath() {
    return 'i18n/user/user_authentication/auth_${locale.languageCode}.json';
  }
}

class _AuthenticationLocalizationDelegate
    extends AppLocalizationsDelegate<AuthenticationLocalization> {
  const _AuthenticationLocalizationDelegate();

  @override
  AuthenticationLocalization getInstance(Locale locale) {
    return AuthenticationLocalization(locale);
  }
}
