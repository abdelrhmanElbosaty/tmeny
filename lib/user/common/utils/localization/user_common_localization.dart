import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/base/localization/app_localization.dart';

class UserCommonLocalization extends AppLocalizations {
  UserCommonLocalization(Locale locale) : super(locale);

  static const LocalizationsDelegate<UserCommonLocalization> delegate =
      _MainUserHostLocalizationDelegate();

  @override
  String getLocalizationPath() {
    return 'i18n/user/user_${locale.languageCode}.json';
  }
}

class _MainUserHostLocalizationDelegate
    extends AppLocalizationsDelegate<UserCommonLocalization> {
  const _MainUserHostLocalizationDelegate();

  @override
  UserCommonLocalization getInstance(Locale locale) {
    return UserCommonLocalization(locale);
  }
}
