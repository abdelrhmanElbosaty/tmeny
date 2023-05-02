import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

Future<T?> appBottomSheetCommon<T>(
  context, {
  required Widget Function(BuildContext context) builder,
  bool checkBorder = true,
  bool useRootNavigator = true,
  Color? barrierColor,
  Color? backgroundColor,
}) async {
  return showModalBottomSheet<T>(
    useRootNavigator: useRootNavigator,
    backgroundColor: backgroundColor ?? AppColors.forthColor,
    clipBehavior: Clip.antiAlias,
    barrierColor: barrierColor,
    shape: RoundedRectangleBorder(
      borderRadius: checkBorder
          ? const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )
          : BorderRadius.circular(0),
    ),
    isScrollControlled: true,
    context: context,
    builder: builder,
  );
}

Future<T?> appBottomSheetCommonWithAnimation<T>(
  context, {
  required Widget Function(BuildContext context) builder,
  bool checkBorder = true,
  bool useRootNavigator = true,
  Color? barrierColor,
  Color? backgroundColor,
  required AnimationController controller,
}) async {
  return showModalBottomSheet<T>(
    transitionAnimationController: controller,
    useRootNavigator: useRootNavigator,
    backgroundColor: backgroundColor ?? AppColors.forthColor,
    clipBehavior: Clip.antiAlias,
    barrierColor: barrierColor,
    shape: RoundedRectangleBorder(
      borderRadius: checkBorder
          ? const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )
          : BorderRadius.circular(0),
    ),
    isScrollControlled: true,
    context: context,
    builder: builder,
  );
}
