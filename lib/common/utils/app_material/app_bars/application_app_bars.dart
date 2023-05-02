import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';


class ApplicationAppBars {
  ApplicationAppBars._();

  static AppBar normalAppBarCustomized(
      {required String title,
      BuildContext? context,
      VoidCallback? onBackPressed,
      Color tintColor = AppColors.textPrimaryColor,
      bool useCloseButton = false,
      List<Widget>? actions}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          useCloseButton
              ? CupertinoIcons.clear_thick_circled
              : CupertinoIcons.back,
          color: tintColor,
        ),
        onPressed: () {
          if (context != null) {
            _onBackPressed(context);
          }

          if (onBackPressed != null) {
            onBackPressed();
          }
        },
      ),
      actions: actions,
      toolbarHeight: Dimensions.toolbarHeight,
      title: Text(
        title,
        style:
            TextStyles.semiBold(color: tintColor, fontSize: Dimensions.xLarge),
      ),
    );
  }

  static AppBar defaultAppBar(
      {required String title,
      BuildContext? context,
      VoidCallback? onBackPressed,
      Color tintColor = AppColors.neutral_900,
      bool useCloseButton = false,
      bool centerTitle = false,
      List<Widget>? actions}) {
    return AppBar(
      backgroundColor: AppColors.appBackgroundColor,
      elevation: 0,
      centerTitle: centerTitle,
      leading: useCloseButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: tintColor,
              ),
              onPressed: () {
                if (context != null) {
                  if (onBackPressed != null) {
                    onBackPressed();
                  } else {
                    _onBackPressed(context);
                  }
                }
              },
            )
          : const SizedBox(),
      actions: actions,
      title: Text(
        title,
        style: TextStyles.bold(color: tintColor, fontSize: Dimensions.xLarge),
      ),
    );
  }
  static AppBar homeAppBar({
    required List<Widget>? actions,
    required Widget title,
    required Widget leading,
    required BuildContext context,
  }) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: Dimensions.toolbarHeight+20,
      elevation: 0,
      backgroundColor: AppColors.forthColor,
      shadowColor: Colors.transparent,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
  static void _onBackPressed(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
