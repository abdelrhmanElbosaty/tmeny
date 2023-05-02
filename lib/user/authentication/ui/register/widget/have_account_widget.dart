import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_with_email_page.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class HaveAccountWidget extends StatelessWidget {
const   HaveAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AuthenticationLocalizer.alreadyHaveAccount,
          style: TextStyles.regular(
            fontSize: Dimensions.normal,
            color: AppColors.neutral_900,
          ),
        ),
        InkWell(
          onTap: (){
            pushMaterialPage(context, const UserLoginPage(),rootNavigator: true);
          },
          child: Text(
            AuthenticationLocalizer.login,
            style: TextStyles.bold(
              fontSize: Dimensions.normal,
              color: AppColors.primary_300,
              textDecoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
