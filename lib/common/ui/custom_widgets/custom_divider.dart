import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {Key? key,
      this.dividerThickness,
      this.verticalPadding,
      this.horizontalPadding,
      this.dividerColor})
      : super(key: key);

  final double? dividerThickness;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? PaddingDimensions.normal,
          horizontal: horizontalPadding ?? PaddingDimensions.normal),
      child: Divider(thickness: dividerThickness ?? .7 ,color:  dividerColor ?? AppColors.dividerGryColor ,),
    );
  }
}
