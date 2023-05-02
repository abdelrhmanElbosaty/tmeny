import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/di/localizations_container.dart';
import 'user_common_localization.dart';

class UserCommonLocalizer {
  UserCommonLocalizer._();

  static UserCommonLocalization get _localizer =>
      injector.get<LocalizationsContainer>().getLocalizations();

  static String get home => _localizer.translate("home");
  static String get appName => _localizer.translate("appName");
  static String get bookings => _localizer.translate("bookings");
  static String get updates => _localizer.translate("updates");
  static String get menu => _localizer.translate("menu");

}
