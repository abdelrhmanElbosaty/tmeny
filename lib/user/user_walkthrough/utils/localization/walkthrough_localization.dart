import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/base/localization/app_localization.dart';

class WalkthroughLocalization extends AppLocalizations {
  WalkthroughLocalization(Locale locale) : super(locale);

  static const LocalizationsDelegate<WalkthroughLocalization> delegate =
      _AuthenticationLocalizationDelegate();

  @override
  String getLocalizationPath() {
    return 'i18n/user/user_walkthrough/walkthrough_${locale.languageCode}.json';
  }
}

class _AuthenticationLocalizationDelegate
    extends AppLocalizationsDelegate<WalkthroughLocalization> {
  const _AuthenticationLocalizationDelegate();

  @override
  WalkthroughLocalization getInstance(Locale locale) {
    return WalkthroughLocalization(locale);
  }
}
