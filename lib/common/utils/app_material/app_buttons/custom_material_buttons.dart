import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/switched_widget.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import '../app_progress/app_progress_indicator.dart';

class AppMaterialButtons extends StatelessWidget {
  const AppMaterialButtons(
      {Key? key,
      this.onPressed,
      this.buttonColor,
      this.elevation,
      this.padding,
      this.height,
      this.shape,
      this.child,
      this.text,
      this.disabledButtonColor,
      this.minWidth,
      this.textStyle,
      this.isLoading = false,
      this.isExpanded = true,
      this.textColor,
      this.fontSize,
      this.disabledTextColor,
      this.textDecoration,
      this.margin})
      : super(key: key);
  final void Function()? onPressed;
  final Color? buttonColor;
  final String? text;
  final Color? textColor;
  final Color? disabledTextColor;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? disabledButtonColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final ShapeBorder? shape;
  final Widget? child;
  final double? minWidth;
  final bool isLoading;
  final bool isExpanded;
  final TextDecoration? textDecoration;

  static AppMaterialButtons primaryButton(
      {required String text,
      void Function()? onPressed,
      bool? isExpanded,
      EdgeInsetsGeometry? margin,
      bool? isLoading,
      double? height,
      double? fontSize,
      TextDecoration? textDecoration}) {
    return AppMaterialButtons(
      margin: margin,
      text: text,
      fontSize: fontSize,
      height: height,
      isExpanded: isExpanded ?? true,
      onPressed: onPressed,
      isLoading: isLoading ?? false,
    );
  }

  static AppMaterialButtons textButton({
    required String text,
    double? fontSize,
    void Function()? onPressed,
    TextStyle? textStyle,
    TextDecoration? textDecoration,
    Color? disabledTextColor,
    Color? textColor,
    double? height,
    bool? isLoading,
  }) {
    return AppMaterialButtons(
      text: text,
      height: height,
      onPressed: onPressed,
      disabledTextColor: disabledTextColor ?? AppColors.primary_200,
      buttonColor: Colors.transparent,
      disabledButtonColor: Colors.transparent,
      elevation: 0,
      isExpanded: false,
      textColor: textColor ?? AppColors.primary_300,
      textDecoration: textDecoration,
      fontSize: fontSize,
      isLoading: isLoading ?? false,
    );
  }

  static AppMaterialButtons outline({
    required String text,
    double? fontSize,
    void Function()? onPressed,
    TextStyle? textStyle,
    TextDecoration? textDecoration,
    Color? disabledTextColor,
    Color? textColor,
    double? height,
  }) {
    return AppMaterialButtons(
      text: text,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(width: 1, color: AppColors.primary_300)),
      onPressed: onPressed,
      disabledTextColor: disabledTextColor ?? AppColors.primary_200,
      buttonColor: Colors.transparent,
      disabledButtonColor: Colors.transparent,
      elevation: 0,
      isExpanded: false,
      textColor: textColor ?? AppColors.primary_300,
      textDecoration: textDecoration,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: MaterialButton(
        onPressed: isLoading ? null : onPressed,
        focusColor: buttonColor ?? AppColors.primary_300,
        disabledColor: disabledButtonColor ?? AppColors.primary_200,
        splashColor: Colors.transparent,
        textColor: textColor ?? AppColors.forthColor,
        color: buttonColor ?? AppColors.primary_300,
        elevation: elevation ?? 0,
        highlightColor: Colors.transparent,
        focusElevation: 0,
        highlightElevation: 0,
        padding: padding,
        height: height ?? Dimensions.buttonHeight,
        disabledTextColor: disabledTextColor ?? AppColors.forthColor,
        disabledElevation: elevation,
        minWidth: minWidth,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
        child: Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: IconDimensions.small,
            ),
            isExpanded
                ? Expanded(
                    child: Center(
                      child: child ??
                          Text(
                            text ?? 'Enter text parameter',
                            style: textStyle ??
                                TextStyles.bold(
                                    textDecoration: textDecoration,
                                    color: textColor ?? AppColors.forthColor,
                                    fontSize: fontSize ?? Dimensions.large),
                          ),
                    ),
                  )
                : Center(
                    child: child ??
                        Text(
                          text ?? 'Enter text parameter',
                          style: textStyle ??
                              TextStyles.bold(
                                  textDecoration: textDecoration,
                                  color: textColor ?? AppColors.forthColor,
                                  fontSize: fontSize ?? Dimensions.large),
                        ),
                  ),
            SwitchedWidget(
              isEnabled: isLoading,
              on: (context) => Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: PaddingDimensions.normal),
                  child: SizedBox(
                    height: IconDimensions.xSmall,
                    width: IconDimensions.xSmall,
                    child: AppProgressIndicator(
                      color: textColor ?? AppColors.forthColor,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
              off: (context) => SizedBox(
                width: IconDimensions.small,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
