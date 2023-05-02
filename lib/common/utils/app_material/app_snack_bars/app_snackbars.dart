import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_icons/app_icons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';
import 'package:tmeny_flutter/common/utils/common.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import '../../app_dimensions/dimensions.dart';

class AppSnackBars extends StatelessWidget {
  const AppSnackBars({
    Key? key,
    this.duration,
    this.leadingIconPath,
    required this.title,
    this.subTitle,
    this.borderSide,
    this.elevation,
    this.color,
    this.snackBarBehavior,
    this.snackBarPosition,
    this.leadingWidget,
  }) : super(key: key);

  final int? duration;
  final String? leadingIconPath;
  final String title;
  final String? subTitle;
  final BorderSide? borderSide;
  final double? elevation;
  final Color? color;
  final SnackBarBehavior? snackBarBehavior;
  final SnackBarPosition? snackBarPosition;
  final Widget? leadingWidget;

  static void success(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        leadingIconPath: IconsPaths.circleDone,
        borderSide: const BorderSide(width: 1.2, color: AppColors.success_200),
      ).build(context) as SnackBar,
    );
  }

  static void error(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        color: AppColors.secondary_100,
        leadingIconPath: IconsPaths.infoCircle,
        borderSide: const BorderSide(width: 1, color: AppColors.danger_500),
      ).build(context) as SnackBar,
    );
  }

  static void warning(context, {required String title, String? subTitle}) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        subTitle: subTitle,
        color: AppColors.warning_100,
        leadingIconPath: IconsPaths.warning,
        borderSide: const BorderSide(width: 1, color: AppColors.warning_200),
      ).build(context) as SnackBar,
    );
  }

  static void networkError(
    context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: CommonLocalizer.networkError,
        color: AppColors.secondary_100,
        leadingIconPath: IconsPaths.infoCircle,
        borderSide: const BorderSide(width: 1, color: AppColors.danger_500),
      ).build(context) as SnackBar,
    );
  }

  static void internetConnection(context, {bool hasConnection = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        snackBarPosition: SnackBarPosition.bottom,
        title: hasConnection
            ? CommonLocalizer.hasInternetConnection
            : CommonLocalizer.noInternetConnection,
        leadingWidget: hasConnection
            ? const Icon(
                Icons.wifi,
                size: 20,
              )
            : const Icon(
                Icons.wifi_off_outlined,
                size: 20,
              ),
        borderSide: const BorderSide(width: 1, color: AppColors.neutral_30),
      ).build(context) as SnackBar,
    );
  }

  static void hint(context, {required String title, required IconData icon}) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBars(
        title: title,
        leadingWidget: Icon(icon),
        borderSide: const BorderSide(width: 1, color: AppColors.neutral_30),
      ).build(context) as SnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      // onVisible: () {
      //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // },

      margin: toastMargin(context, snackBarPosition),
      behavior: snackBarBehavior ?? SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: borderSide ?? BorderSide.none),
      duration: Duration(seconds: duration ?? shortDurationInSec),
      backgroundColor: color ?? Colors.white,
      elevation: elevation,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _leading(),
          SizedBox(width: Dimensions.small),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 5,
                // ),
                Text(
                  title,
                  style: TextStyles.medium(
                    color: AppColors.neutral_900,
                    fontSize: Dimensions.normal,
                  ),
                ),
                subTitle != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          subTitle!,
                          style: TextStyles.regular(
                              color: AppColors.neutral_400,
                              fontSize: Dimensions.normal,
                              height: 1.1),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _leading() {
    if (leadingIconPath != null) {
      return AppIcons(
        imagePath: leadingIconPath!,
        height: 20,
        width: 20,
      );
    } else if (leadingWidget != null) {
      return leadingWidget!;
    } else {
      return const SizedBox();
    }
  }

  static const double toastHorizontalMargin = 16;

  EdgeInsetsGeometry? toastMargin(context, SnackBarPosition? snackBarPosition) {
    switch (snackBarPosition) {
      case null:
      case SnackBarPosition.normal:
        return null;
      case SnackBarPosition.bottom:
        return EdgeInsets.only(
            bottom: (MediaQuery.of(context).viewPadding.bottom + 45),
            right: toastHorizontalMargin,
            left: toastHorizontalMargin);
      case SnackBarPosition.center:
        return EdgeInsets.only(
            bottom: (MediaQuery.of(context).size.height * .46),
            right: toastHorizontalMargin,
            left: toastHorizontalMargin);
      case SnackBarPosition.top:
        return EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).viewPadding.top + kToolbarHeight + 35),
            right: toastHorizontalMargin,
            left: toastHorizontalMargin);
    }
  }
}

enum SnackBarPosition { bottom, center, top, normal }
