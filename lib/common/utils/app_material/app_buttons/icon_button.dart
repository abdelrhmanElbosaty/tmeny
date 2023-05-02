import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class IconsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isBold;
  final Color? textColor;
  final Color? backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double? cornerRadius;
  final double borderWidth;
  final Color? borderColor;
  final double buttonHeight;
  final IconData? buttonIcon;
  final double? iconSize;
  final bool isLoading;
  final List<Color>? gradiantColors;
  final double? fontSize;
  final bool verifyIcon;
  final bool isShadow;
  final Color? color;
  final bool isExpanded;
  final TextStyle? textStyle;
  final Widget? actionWidget;
  final BoxShadow? buttonShadow;
  final Widget? iconImageAssets;

  IconsButton(
      {Key? key,
      required this.onPressed,
      this.isBold = true,
      this.textColor,
      this.backgroundColor,
      this.horizontalPadding = 48,
      this.verticalPadding = 8,
      this.cornerRadius,
      this.borderWidth = 0,
      this.borderColor,
      double? buttonHeight,
      double? buttonWidth = 16,
      this.buttonIcon,
      this.iconSize,
      this.isLoading = false,
      this.gradiantColors,
      this.fontSize,
      this.verifyIcon = false,
      this.isShadow = true,
      this.color,
      this.isExpanded = false,
      this.textStyle,
      this.actionWidget,
      this.buttonShadow,
      this.iconImageAssets})
      : buttonHeight = buttonHeight ?? Dimensions.buttonHeight,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
          height: buttonHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            gradient: gradiantColors == null
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: gradiantColors!,
                  ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            minRadius: 10,
            maxRadius: 30,
            child: Icon(
              buttonIcon,
              color: textColor,
              size: iconSize ?? IconDimensions.small,
            ),
          )),
    );
  }

  static IconsButton iconButton({
    required VoidCallback onPressed,
    bool isLoading = false,
    double horizontalPadding = 48,
    double verticalPadding = 0,
    double? buttonHeight,
    Color? color,
    Color? borderColor,
    IconData? buttonIcon,
    final List<Color>? gradiantColors,
    Color? textColor,
    double? fontSize,
    double? cornerRadius,
    bool? verifyIcon,
    bool isBold = false,
    bool isShadow = true,
    bool? isExpanded,
    double? borderWidth,
    TextStyle? textStyle,
    double? iconSize,
    Widget? actionWidget,
    BoxShadow? buttonShadow,
  }) {
    return IconsButton(
      borderWidth: borderWidth ?? 0,
      isShadow: isShadow,
      borderColor: borderColor ?? AppColors.borderColor,
      gradiantColors: gradiantColors ?? AppColors.buttonDefaultGradiantColors,
      fontSize: fontSize,
      onPressed: onPressed,
      cornerRadius: cornerRadius ?? 24,
      isBold: isBold,
      textColor: textColor ?? AppColors.textForthColor,
      isLoading: isLoading,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
      iconSize: iconSize,
      verifyIcon: verifyIcon ?? false,
      color: color,
      isExpanded: isExpanded ?? false,
      textStyle: textStyle,
      actionWidget: actionWidget,
      buttonShadow: buttonShadow,
    );
  }
}
