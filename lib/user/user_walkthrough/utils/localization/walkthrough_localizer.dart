import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/di/localizations_container.dart';
import 'package:tmeny_flutter/user/user_walkthrough/utils/localization/walkthrough_localization.dart';

class WalkthroughLocalizer {
  WalkthroughLocalizer._();

  static WalkthroughLocalization get _localizer =>
      injector.get<LocalizationsContainer>().getLocalizations();

  static String get firstPageTitle => _localizer.translate("firstPageTitle");
  static String get firstPageDescription => _localizer.translate("firstPageDescription");
  static String get secondPageTitle => _localizer.translate("secondPageTitle");
  static String get secondPageDescription => _localizer.translate("secondPageDescription");
  static String get thirdPageTitle => _localizer.translate("thirdPageTitle");
  static String get thirdPageDescription => _localizer.translate("thirdPageDescription");
  static String get buttonName => _localizer.translate("buttonName");
  static String get buttonNameOFLastPage => _localizer.translate("buttonNameOFLastPage");
  static String get joinAsADoctor => _localizer.translate("joinAsADoctor");
  static String get lang => _localizer.translate("lang");

}
