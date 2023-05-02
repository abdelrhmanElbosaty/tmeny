import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/switched_widget.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_progress/app_progress_indicator.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import '../../../utils/app_style/text_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
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

  AppButton(
      {Key? key,
      required this.title,
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
    final shouldShowIcon = buttonIcon != null;
    return Stack(
      children: [
        GestureDetector(
          onTap: isLoading ? () {} : onPressed,
          child: Container(
            padding: EdgeInsets.only(
              right: horizontalPadding,
              left: horizontalPadding,
              top: verticalPadding,
              bottom: verticalPadding,
            ),
            height: buttonHeight,
            decoration: BoxDecoration(
              // color: backgroundColor?.withOpacity(0.96),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(cornerRadius ?? 4),
              // border: Border.all(
              //     color: borderColor ?? AppColors.borderColor,
              //     width: borderWidth),
              boxShadow: isShadow
                  ? <BoxShadow>[
                      buttonShadow == null
                          ? BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.15),
                              blurRadius: 15.0,
                              offset: const Offset(5, 18),
                            )
                          : buttonShadow!,
                    ]
                  : [],
              gradient: gradiantColors == null
                  ? null
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: gradiantColors!,
                    ),
            ),
            child: verifyIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize:
                        isExpanded ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: isBold
                            ? TextStyles.bold(
                                color: textColor ?? AppColors.textForthColor,
                                fontSize: fontSize ?? Dimensions.normal)
                            : TextStyles.medium(
                                color: textColor ?? AppColors.textForthColor,
                                fontSize: fontSize ?? Dimensions.normal),
                      ),
                      SizedBox(
                        width: PaddingDimensions.large,
                      ),
                      shouldShowIcon
                          ? Icon(
                              buttonIcon,
                              color: textColor,
                              size: iconSize ?? IconDimensions.small,
                            )
                          : Icon(
                              buttonIcon,
                              color: Colors.white,
                              size: iconSize ?? IconDimensions.small,
                            ),
                    ],
                  )
                : !verifyIcon && actionWidget == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize:
                            isExpanded ? MainAxisSize.max : MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: isBold == false && textStyle != null
                                ? textStyle
                                : isBold
                                    ? TextStyles.bold(
                                        color: textColor ??
                                            AppColors.textPrimaryColor,
                                        fontSize: fontSize ?? Dimensions.normal)
                                    : TextStyles.medium(
                                        color: textColor ??
                                            AppColors.textForthColor,
                                        fontSize:
                                            fontSize ?? Dimensions.normal),
                          ),
                          shouldShowIcon
                              ? SizedBox(
                                  width: PaddingDimensions.normal,
                                )
                              : isLoading
                                  ? SizedBox(
                                      width: PaddingDimensions.normal,
                                    )
                                  : const SizedBox(),
                          shouldShowIcon
                              ? Icon(
                                  buttonIcon,
                                  color: textColor,
                                  size: iconSize ?? IconDimensions.small,
                                )
                              : isLoading
                                  ? Icon(
                                      buttonIcon,
                                      color:AppColors.primary_500,
                                      size: iconSize ?? IconDimensions.small,
                                    )
                                  : const SizedBox(),
                          iconImageAssets != null
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    left: PaddingDimensions.small,
                                  ),
                                  child: iconImageAssets!,
                                )
                              : const SizedBox(
                                  width: 0,
                                ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize:
                            isExpanded ? MainAxisSize.max : MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: isBold
                                  ? TextStyles.bold(
                                      color:
                                          textColor ?? AppColors.textForthColor,
                                      fontSize: fontSize ?? Dimensions.normal)
                                  : TextStyles.medium(
                                      color:
                                          textColor ?? AppColors.textForthColor,
                                      fontSize: fontSize ?? Dimensions.normal),
                            ),
                          ),
                          SizedBox(
                            width: PaddingDimensions.large,
                          ),
                          actionWidget!,
                        ],
                      ),
          ),
        ),
        SwitchedWidget(
          isEnabled: isLoading,
          on: (context) => Positioned(
            right: 12,
            bottom: 8,
            top: 8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: SizedBox(
                  height: IconDimensions.xSmall,
                  width: IconDimensions.xSmall,
                  child: AppProgressIndicator(
                    color: textColor ?? AppColors.textForthColor,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ),
          off: (context) => const SizedBox(),
        ),
      ],
    );
  }

  static AppButton primaryButton(
      {required String title,
      required VoidCallback onPressed,
      bool isLoading = false,
      double horizontalPadding = 48,
      double verticalPadding = 0,
      double? buttonHeight,
      Color? color,
      IconData? buttonIcon,
      final List<Color>? gradiantColors,
      Color? textColor,
      double? fontSize,
      double cornerRadius = 8,
      bool isBold = true,
      Color? borderColor = AppColors.primaryColor,
      bool? verifyIcon,
      bool? isShadow,
      bool? isExpanded,
      TextStyle? textStyle,
      double? borderWidth,
      Widget? actionWidget,
      Color? backgroundColor,
      Widget? iconImageAssets,
      double? iconSize}) {
    return AppButton(
      isShadow: isShadow ?? false,
      borderColor: borderColor,
      // gradiantColors: gradiantColors,
      // ?? AppColors.buttonDefaultGradiantColors,
      fontSize: fontSize,
      title: title,
      onPressed: onPressed,
      cornerRadius: cornerRadius,
      isBold: isBold,
      textColor: textColor ?? AppColors.textForthColor,
      isLoading: isLoading,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
      verifyIcon: verifyIcon ?? false,
      color: color,
      isExpanded: isExpanded ?? false,
      textStyle: textStyle,
      borderWidth: borderWidth ?? 0,
      actionWidget: actionWidget,
      backgroundColor: AppColors.primary_300,
      iconImageAssets: iconImageAssets,
      iconSize: iconSize,
    );
  }

  static AppButton languageButton(
      {required String title,
      required VoidCallback onPressed,
      bool isLoading = false,
      double horizontalPadding = 48,
      double verticalPadding = 0,
      double? buttonHeight,
      Color? color,
      IconData? buttonIcon,
      final List<Color>? gradiantColors,
      Color? textColor,
      double? fontSize,
      double cornerRadius = 8,
      bool isBold = false,
      Color? borderColor = AppColors.primaryColor,
      bool? verifyIcon,
      bool? isShadow,
      bool? isExpanded,
      TextStyle? textStyle,
      double? borderWidth,
      Widget? actionWidget,
      Color? backgroundColor,
      Widget? iconImageAssets}) {
    return AppButton(
      isShadow: isShadow ?? true,
      borderColor: borderColor,
      gradiantColors: gradiantColors ?? AppColors.buttonDefaultGradiantColors,
      fontSize: fontSize,
      title: title,
      onPressed: onPressed,
      cornerRadius: cornerRadius,
      isBold: isBold,
      textColor: textColor ?? AppColors.textForthColor,
      isLoading: isLoading,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
      verifyIcon: verifyIcon ?? false,
      color: color,
      isExpanded: isExpanded ?? false,
      textStyle: textStyle,
      borderWidth: borderWidth ?? 0,
      actionWidget: actionWidget,
      backgroundColor: backgroundColor,
      iconImageAssets: iconImageAssets,
    );
  }

  static AppButton defaultButton({
    required String title,
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
    return AppButton(
      borderWidth: borderWidth ?? 0,
      isShadow: isShadow,
      borderColor: borderColor ?? AppColors.borderColor,
      gradiantColors: gradiantColors ?? AppColors.buttonDefaultGradiantColors,
      fontSize: fontSize,
      title: title,
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

  static AppButton questionButton({
    required String title,
    required VoidCallback onPressed,
    double horizontalPadding = 48,
    double verticalPadding = 0,
    double? buttonHeight,
    Color? color,
    Color? borderColor,
    Color? textColor,
    double? fontSize,
    double? cornerRadius,
    bool isBold = false,
  }) {
    return AppButton(
      borderColor: borderColor ?? AppColors.borderColor,
      fontSize: fontSize,
      title: title,
      onPressed: onPressed,
      cornerRadius: cornerRadius ?? 24,
      isBold: isBold,
      textColor: textColor ?? AppColors.textForthColor,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      color: color,
    );
  }

  static AppButton outlinedButton({
    required String title,
    required VoidCallback onPressed,
    bool isLoading = false,
    bool isShadow = false,
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
    bool? isExpanded,
    bool? isBold,
  }) {
    return AppButton(
      isShadow: true,
      borderColor: borderColor ?? AppColors.borderColor,
      gradiantColors: gradiantColors ?? AppColors.buttonDefaultGradiantColors,
      fontSize: fontSize,
      title: title,
      onPressed: onPressed,
      cornerRadius: cornerRadius ?? 24,
      isBold: isBold ?? true,
      textColor: textColor ?? AppColors.textForthColor,
      isLoading: isLoading,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
      verifyIcon: verifyIcon ?? false,
      isExpanded: isExpanded ?? false,
    );
  }

  static AppButton secondaryButton({
    required String title,
    required VoidCallback onPressed,
    bool isLoading = false,
    double horizontalPadding = 16,
    double verticalPadding = 0,
    double? buttonHeight,
    double? buttonWidth,
    IconData? buttonIcon,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      borderColor: Colors.transparent,
      cornerRadius: 4,
      isBold: false,
      textColor: textColor ?? AppColors.textForthColor,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
    );
  }

  static AppButton unEnabledButton({
    required String title,
    bool isLoading = false,
    double horizontalPadding = 48,
    double verticalPadding = 0,
    double? buttonHeight,
    Color? color,
    IconData? buttonIcon,
    Color? textColor,
    double? fontSize,
    double cornerRadius = 24,
    bool isBold = false,
    Color? borderColor,
    Color? backgroundColor,
    bool? verifyIcon,
    bool? isShadow,
    bool? isExpanded,
    double? borderWidth,
  }) {
    return AppButton(
      backgroundColor: backgroundColor ?? AppColors.thirdGreyColor,
      borderWidth: borderWidth ?? 0,
      isShadow: isShadow ?? false,
      borderColor: borderColor ?? AppColors.thirdGreyColor,
      fontSize: fontSize,
      title: title,
      onPressed: () {},
      cornerRadius: cornerRadius,
      isBold: isBold,
      textColor: textColor ?? AppColors.textForthColor,
      isLoading: isLoading,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      buttonHeight: buttonHeight ?? Dimensions.buttonHeight,
      buttonIcon: buttonIcon,
      verifyIcon: verifyIcon ?? false,
      color: color,
      isExpanded: isExpanded ?? false,
    );
  }
}




