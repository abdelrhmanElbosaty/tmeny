import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> expansionListOfWidget;
  final double? marginHorizontalPadding;
  final double? marginVerticalPadding;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.expansionListOfWidget,
    this.marginHorizontalPadding,
    this.marginVerticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontalPadding ?? PaddingDimensions.large,
          vertical: marginVerticalPadding ?? PaddingDimensions.normal),
      decoration: BoxDecoration(
        color: AppColors.forthColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor, width: 0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ExpansionTile(
        // collapsedShape: RoundedRectangleBorder(
        //   side: const BorderSide(color: AppColors.border),
        //   borderRadius: BorderRadius.circular(8),
        // ),
        // shape: RoundedRectangleBorder(
        //   side: const BorderSide(color: AppColors.border),
        //   borderRadius: BorderRadius.circular(8),
        // ),
        iconColor: AppColors.neutral_30,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyles.medium(
            color: AppColors.textPrimaryColor,
            fontSize: Dimensions.large,
          ),
        ),
        children: expansionListOfWidget,
      ),
    );
  }
}