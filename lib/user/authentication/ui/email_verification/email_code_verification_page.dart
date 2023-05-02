import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_cubit.dart';
import 'widgets/verification_code_timer.dart';
import 'widgets/verification_form.dart';

class EmailCodeVerificationPage extends StatelessWidget with NamedRoute {
  final String title;
  final EmailVerificationCodeInput emailVerificationCodeInput;

  const EmailCodeVerificationPage({
    Key? key,
    required this.emailVerificationCodeInput,
    required this.title,
  }) : super(key: key);

  @override
  String get routeName => "EmailCodeVerificationPage";

  static String className = "EmailCodeVerificationPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VerificationEmailCodeCubit(),
        child: Scaffold(
          backgroundColor: AppColors.appBackgroundColor,
          appBar: ApplicationAppBars.defaultAppBar(
              context: context,
              title: title,
              useCloseButton: true),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: PaddingDimensions.xLarge,
                horizontal: PaddingDimensions.normal),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  emailVerificationCodeInput.verificationUsage ==
                          VerificationUsage.passwordReset
                      ? Text(CommonLocalizer.emailVerification,
                          style: TextStyles.bold(
                            color: AppColors.neutral_700,
                            fontSize: Dimensions.xxxxLarge,
                          ))
                      : const SizedBox(),
                  const SizedBox(height: 15,),
                  Text(CommonLocalizer.codeThatWasSent,
                      style: TextStyles.regular(
                        color: AppColors.neutral_700,
                        fontSize: Dimensions.large,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(emailVerificationCodeInput.email,
                      style: TextStyles.medium(
                        color: AppColors.neutral_900,
                        fontSize: Dimensions.normal,
                      )),
                  SizedBox(height: PaddingDimensions.xxLarge),
                  EmailVerificationForm(
                    emailVerificationCodeInput: emailVerificationCodeInput,
                  ),
                  SizedBox(height: PaddingDimensions.large),
                  VerificationCodeTimer(
                      emailVerificationCodeInput: emailVerificationCodeInput),
                ],
              ),
            ),
          ),
        ));
  }
}


