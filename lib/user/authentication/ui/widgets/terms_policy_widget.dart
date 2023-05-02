import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class TermsAndPolicyWidget extends StatelessWidget {
  const TermsAndPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: PaddingDimensions.normal),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: AuthenticationLocalizer.continuingAgreeText,
            style: TextStyles.regular(
                fontSize: Dimensions.normal,
                color: AppColors.neutral_900,
                height: 1.5),
            children: [
              TextSpan(
                text: AuthenticationLocalizer.termsAndConditions,
                style: TextStyles.regularUnderlined(
                  fontSize: Dimensions.normal,
                  color: AppColors.neutral_900,
                ),
              ),
              TextSpan(
                text: AuthenticationLocalizer.and,
                style: TextStyles.regular(
                  fontSize: Dimensions.normal,
                  color: AppColors.neutral_900,
                ),
              ),
              TextSpan(
                text: AuthenticationLocalizer.privacyPolicy,
                style: TextStyles.regularUnderlined(
                  fontSize: Dimensions.normal,
                  color: AppColors.neutral_900,
                ),
              ),
            ]),
      ),
    );
  }
}
