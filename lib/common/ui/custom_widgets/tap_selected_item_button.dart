import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/app_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

// ignore: must_be_immutable
class TapSelectedItemButton extends StatelessWidget {
  TapSelectedItemButton({
    Key? key,
    required this.onTapFun,
    required this.title,
    this.isSelected = false,
    this.inActiveBorderColor,
    this.inActiveTextStyle,
    this.borderWidth,
    this.buttonHeight,
    this.isExpanded = false,
    this.activeTextStyle,
  }) : super(key: key);

  final VoidCallback onTapFun;
  final String title;
  final bool isSelected;
  final Color? inActiveBorderColor;
  final TextStyle? inActiveTextStyle;
  final double? borderWidth;
  final double? buttonHeight;
  bool isExpanded = false;
  final TextStyle? activeTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            end: PaddingDimensions.normal, bottom: PaddingDimensions.normal),
        child: isSelected
            ? AppButton.primaryButton(
                title: title,
                onPressed: onTapFun,
                isShadow: false,
                fontSize: Dimensions.normal,
                horizontalPadding: PaddingDimensions.large,
                buttonHeight: buttonHeight ?? PaddingDimensions.xxLarge,
                isBold: false,
                isExpanded: isExpanded,
                textStyle: activeTextStyle ??
                    TextStyles.regular(
                        fontSize: Dimensions.normal, color: AppColors.textForthColor),
                borderWidth: borderWidth ?? 1)
            : AppButton.defaultButton(
                title: title,
                onPressed: onTapFun,
                borderWidth: borderWidth ?? 1,
                horizontalPadding: PaddingDimensions.large,
                borderColor: inActiveBorderColor ?? AppColors.neutral_50,
                isShadow: false,
                buttonHeight: buttonHeight ?? PaddingDimensions.xxLarge,
                isBold: false,
                isExpanded: isExpanded,
                textStyle: inActiveTextStyle ??
                    TextStyles.regular(fontSize: Dimensions.normal, color: AppColors.neutral_50),
              ));
  }
}
