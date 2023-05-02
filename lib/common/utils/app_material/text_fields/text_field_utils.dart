import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

InputDecoration authenticationInputDecoration(
    {bool isDark = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    double? borderRadius,
    Color? borderColor,
    Color? errorBorder,
    Color? focusColor,
    String? errorText,
    String? labelText,
    double? contentPadding,
    double? errorTextFontSize,
    int maxErrorLines = 1}) {
  return InputDecoration(
    labelText: labelText,
    suffixIcon: suffixIcon,
    suffixIconColor: AppColors.neutral_70,
    prefixIcon: prefixIcon,
    hintText: hintText,
    errorText: errorText,
    hintStyle: TextStyles.regular(
      color: AppColors.neutral_100,
      fontSize: Dimensions.normal,
    ),
    filled: true,
    errorStyle: TextStyles.regular(
      color: errorBorder ?? AppColors.danger_500,
      fontSize: errorTextFontSize ?? Dimensions.normal,
      height: 1,
    ),
    errorMaxLines: maxErrorLines,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
      borderSide: BorderSide(
          color: errorBorder ?? AppColors.danger_500,
          width: .6,
          style: BorderStyle.solid),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
      borderSide: BorderSide(
          color: errorBorder ?? AppColors.danger_500,
          width: .6,
          style: BorderStyle.solid),
    ),
    fillColor: AppColors.textForthColor,
    contentPadding: contentPadding == null
        ? EdgeInsets.all(PaddingDimensions.large)
        : EdgeInsets.symmetric(
            vertical: contentPadding, horizontal: contentPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
      borderSide: BorderSide(
          color: borderColor ?? AppColors.neutral_30,
          width: 1,
          style: BorderStyle.none),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
      borderSide: BorderSide(
          color: borderColor ?? AppColors.neutral_30,
          width: 1,
          style: BorderStyle.solid),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
      borderSide: BorderSide(
          color: borderColor ?? AppColors.neutral_40,
          width: 1,
          style: BorderStyle.solid),
    ),
    focusColor: focusColor ?? AppColors.neutral_40,
    counterText: "",
  );
}
