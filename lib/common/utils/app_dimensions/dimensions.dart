import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Dimensions {
  Dimensions._();
  static late bool isMobile;
  static bool get isPortrait => SizerUtil.orientation == Orientation.portrait;

  static double get xSmall => isMobile ? 6 : 4;
  static double get small => isMobile ? 8 : 5;
  static double get normal => isMobile ? 10 : 6;
  static double get large => isMobile ? 12 : 7;
  static double get xLarge => isMobile ? 14 : 8;
  static double get xxLarge => isMobile ? 16 : 10;
  static double get xxxLarge => isMobile ? 18 : 12;
  static double get xxxxLarge => isMobile ? 20 : 14;
  static double get xxxxxLarge => isMobile ? 22 : 20;
  static double get header => isMobile ? 20 : 14;

  static double get buttonHeight => isMobile ? 48 : 64;
  static double get buttonMiniHeight => isMobile ? 40 : 56;
  static const double actionButtonHeight = 100;
  static const double textHeight = 36;
  static final double pickerItemHeight = isMobile ? 30 : 60;

  static double get leadingWidth =>
      IconDimensions.medium + pageSmallMargins.right;

  static double get toolbarHeight => isMobile ? kToolbarHeight : 72;

  static const double buttonCornerRadius = 24;

  static EdgeInsets pageMargins =
      EdgeInsets.symmetric(horizontal: PaddingDimensions.xxLarge);
  static EdgeInsets pageSmallMargins =
      EdgeInsets.symmetric(horizontal: PaddingDimensions.large);

  static EdgeInsets get formMargins =>
      EdgeInsets.symmetric(horizontal: isMobile ? 32 : 128);
}

class IconDimensions {
  IconDimensions._();

  static double get xSmall => Dimensions.isMobile ? 16 : 24;
  static double get small => Dimensions.isMobile ? 24 : 32;
  static double get medium => Dimensions.isMobile ? 32 : 40;
  static double get large => Dimensions.isMobile ? 40 : 48;
}

class PaddingDimensions {
  PaddingDimensions._();
  static double get small => Dimensions.isMobile ? 4 : 8;
  static double get normal => Dimensions.isMobile ? 8 : 12;
  static double get large => Dimensions.isMobile ? 16 : 24;
  static double get xLarge => Dimensions.isMobile ? 24 : 32;
  static double get xxLarge => Dimensions.isMobile ? 32 : 40;
  static double get xxxLarge => Dimensions.isMobile ? 40 : 48;
  static double get xxxxLarge => Dimensions.isMobile ? 48 : 56;
}

class CustomAppDimensions {
  CustomAppDimensions._();

  static double get filterBarHeight => Dimensions.isMobile ? 40 : 56;
  static double get addIconSize => Dimensions.isMobile ? 28 : 36;
  static double get advertiserProfilePicSize => Dimensions.isMobile ? 56 : 72;
  static double get bottomAppBarSize => Dimensions.isMobile ? 100 : 110;
}
