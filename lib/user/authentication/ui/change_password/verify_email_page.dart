import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_alerts/otp_blocked_alert.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/email_code_verification_page.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_state.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_text_field_tile.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/error_message_widget.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationEmailCodeCubit(),
      child: const _ChangePasswordPageBody(),
    );
  }
}

class _ChangePasswordPageBody extends StatefulWidget {
  const _ChangePasswordPageBody({Key? key}) : super(key: key);

  @override
  State<_ChangePasswordPageBody> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<_ChangePasswordPageBody> {
  bool _isButtonEnabled = false;
  String? _emailAddress;

  @override
  Widget build(BuildContext context) {
    _checkIfSignUpButtonEnabled();
    return BlocConsumer<VerificationEmailCodeCubit, VerificationEmailCodeState>(
      listener: (context, state) {
        if (state.otp.data?.isBlocked ?? false) {
          // Navigator.of(context).pop(true);
          OtpAlerts.blockedOtp(context,
              otp: state.otp.data ?? OTP(0, DateTime.now(), false));
        } else {
          if (state.verifyEmailState.isSuccess) {
            _successFun();
          }
        }
      },
      buildWhen: (previous, current) =>
          previous.verifyEmailState != current.verifyEmailState,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBackgroundColor,
          appBar: ApplicationAppBars.defaultAppBar(
              context: context,
              title: AuthenticationLocalizer.changePassword,
              useCloseButton: true),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingDimensions.large,
                vertical: PaddingDimensions.large),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: PaddingDimensions.xxxxLarge,
                  ),
                  ErrorMessageWidget(
                      isFailure: state.verifyEmailState.isFailure,
                      defaultMessage:
                          AuthenticationLocalizer.changePasswordDescription,
                      errorMessage: state.verifyEmailState.errorMessage ?? ''),
                  SizedBox(
                    height: PaddingDimensions.xxLarge,
                  ),
                  AppTextFieldTile(
                    label: AuthenticationLocalizer.email,
                    hintText: AuthenticationLocalizer.emailHint,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(' '),
                    ],
                    onchange: _onEmailAddressChange,
                  ),
                  SizedBox(
                    height: PaddingDimensions.large,
                  ),
                  AppMaterialButtons.primaryButton(
                    isLoading: state.verifyEmailState.isLoading,
                    text: AuthenticationLocalizer.sendVerificationCode,
                    onPressed: _isButtonEnabled ? _verifyEmail : null,
                    // pushMaterialPage(context,const ReChangePassword());
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _successFun() {
    EmailVerificationCodeInput input = EmailVerificationCodeInput(
        email: _emailAddress ?? '',
        verificationUsage: VerificationUsage.passwordReset);
    pushMaterialPage(
        context,
        EmailCodeVerificationPage(
          emailVerificationCodeInput: input,
          title: CommonLocalizer.changePassword,
        ));
  }

  void _checkIfSignUpButtonEnabled() {
    if (_emailAddress != null && _emailAddress != '') {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }

  void _verifyEmail() {
    FocusScope.of(context).requestFocus(FocusNode());
    BlocProvider.of<VerificationEmailCodeCubit>(context)
        .forgotPasswordVerifyEmail(_emailAddress!);
  }

  void _onEmailAddressChange(String text) {
    _emailAddress = text;
    setState(() {});
  }
}
