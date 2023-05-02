import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_alerts/otp_blocked_alert.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/change_password/update_password_page.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/widgets/pin_code_widget.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_state.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/error_message_widget.dart';

class EmailVerificationForm extends StatefulWidget {
  final EmailVerificationCodeInput emailVerificationCodeInput;

  const EmailVerificationForm({
    Key? key,
    required this.emailVerificationCodeInput,
  }) : super(key: key);

  @override
  State<EmailVerificationForm> createState() => _EmailVerificationFormState();
}

class _EmailVerificationFormState extends State<EmailVerificationForm> {
  final TextEditingController _codeController = TextEditingController();
  static const int _verificationCodeLength = 6;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationEmailCodeCubit, VerificationEmailCodeState>(
      listener: (context, state) {
        if (state.otp.data?.isBlocked ?? false) {
          Navigator.of(context).pop(true);
          OtpAlerts.blockedOtp(context,
              otp: state.otp.data ?? OTP(0, DateTime.now(), false));
        } else {
          if (state.verifyCode.isSuccess) {
            onVerificationSuccess();
          }
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
              child: ErrorMessageWidget(
                  isFailure: state.errorMessage != null,
                  errorMessage: state.errorMessage ?? ''),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: PaddingDimensions.xLarge),
              child: PinCodeWidget(
                codeController: _codeController,
                hasError:
                    state.verifyCode.isFailure || state.resendCode.isFailure,
                onChange: onCodeChanged,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
              child: AppMaterialButtons.primaryButton(
                isLoading: state.verifyCode.isLoading,
                text: CommonLocalizer.verify,
                onPressed:
                    _codeController.text.length == 6 ? _onNextPressed : null,
              ),
            )
          ],
        );
      },
    );
  }

  void onCodeChanged(String value) {
    _onNextPressed();
  }

  void _onNextPressed() {
    setState(() {});
    if (_codeController.text.length == _verificationCodeLength) {
      FocusScope.of(context).unfocus();
      onSubmitPressed();
    }
  }

  void onSubmitPressed() {
    final input = VerificationCodeInput(
        verificationCode: _codeController.text,
        email: widget.emailVerificationCodeInput.email);
    if (widget.emailVerificationCodeInput.verificationUsage ==
        VerificationUsage.passwordReset) {
      BlocProvider.of<VerificationEmailCodeCubit>(context)
          .verifyForgetPasswordVerificationCode(input);
    } else {
      BlocProvider.of<VerificationEmailCodeCubit>(context)
          .verifyEmailVerificationCode(input);
    }
  }

  void onVerificationSuccess() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    if (widget.emailVerificationCodeInput.verificationUsage ==
        VerificationUsage.emailVerification) {

    AuthenticationBloc.of(context).add(AuthenticatedEvent());
      //Todo delete comment

      // BlocProvider.of<AuthenticationBloc>(context).add(AuthFirstNameEvent());

      // pushWithName(context,  FirstNamePage.className,FirstNamePage());

      // pushWithName(context, FirstNamePage.className, FirstNamePage());
    } else {
      final input = VerificationCodeInput(
          verificationCode: _codeController.text,
          email: widget.emailVerificationCodeInput.email);
      pushMaterialPage(context,  UpdatePasswordPage(input: input,));
      // pushReplacementMaterialPage(
      //     context,
      //     UpdatePasswordPage(
      //         email: widget.unVerifyUserData.email, code: _code));
    }
  }
}
