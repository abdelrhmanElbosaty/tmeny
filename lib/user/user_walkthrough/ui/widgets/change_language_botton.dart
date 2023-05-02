import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/user_walkthrough/utils/localization/walkthrough_localizer.dart';

class ChangeLanguageBottom extends StatelessWidget {
  const ChangeLanguageBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: PaddingDimensions.normal,
          horizontal: PaddingDimensions.xLarge),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.forthColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        WalkthroughLocalizer.lang,
        style: TextStyles.medium(
            color: AppColors.neutral_0, fontSize: Dimensions.normal),
      ),
    );
  }
}