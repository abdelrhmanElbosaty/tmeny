import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class TextStyles {
  static const String appFontFamily = 'LamaSans';

  static TextStyle light(
          {Color color = AppColors.neutral_900,
          double fontSize = 14.0,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w300,
          fontSize: fontSize.sp);

  static TextStyle regular(
          {Color color = AppColors.neutral_900,
          double fontSize = 14.0,
          TextOverflow? textOverFlow,
          TextDecoration? decoration,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          overflow: textOverFlow ?? TextOverflow.visible,
          fontWeight: FontWeight.w400,
          decoration: decoration,
          fontSize: fontSize.sp);

  static TextStyle bold({
    Color color = Colors.black,
    double fontSize = 14.0,
    double? height,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w700,
          decoration: textDecoration,
          fontSize: fontSize.sp);

  static TextStyle boldUnderlined({
    Color color = Colors.black,
    double fontSize = 14.0,
    double? height,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          fontSize: fontSize.sp);

  static TextStyle regularUnderlined({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) =>
      TextStyle(
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: fontSize.sp,
          decoration: TextDecoration.underline);

  static TextStyle medium(
          {Color color = Colors.black,
          double fontSize = 14.0,
          TextOverflow? textOverFlow,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          overflow: textOverFlow ?? TextOverflow.visible,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: fontSize.sp);

  static TextStyle mediumUnderlined(
          {Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
        color: color,
        fontFamily: appFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: fontSize.sp,
        decoration: TextDecoration.underline,
      );

  static TextStyle semiBold(
          {Color color = Colors.black,
          double fontSize = 14.0,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: fontSize.sp);

  static TextStyle semiBoldLineThrough(
          {Color color = Colors.black,
          double fontSize = 14.0,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: fontSize.sp,
          decoration: TextDecoration.lineThrough);

  static TextStyle thin(
          {Color color = Colors.black,
          double fontSize = 14.0,
          double height = 1}) =>
      TextStyle(
          color: color,
          fontFamily: appFontFamily,
          fontWeight: FontWeight.w100,
          height: height,
          fontSize: fontSize.sp);
}
