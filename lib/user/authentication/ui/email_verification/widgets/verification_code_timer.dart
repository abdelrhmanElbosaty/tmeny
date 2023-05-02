import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_cubit.dart';

class VerificationCodeTimer extends StatefulWidget {
  final EmailVerificationCodeInput emailVerificationCodeInput;

  const VerificationCodeTimer({
    Key? key,
    required this.emailVerificationCodeInput,
  }) : super(key: key);

  @override
  State<VerificationCodeTimer> createState() =>
      _PhoneVerificationResendViewState();
}

const int _countTimerSeconds = 30;

class _PhoneVerificationResendViewState extends State<VerificationCodeTimer> {
  Timer? _timer;
  int timeRemainingInSeconds = _countTimerSeconds;
  static const tickDurationInSeconds = 1;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    _timer?.cancel();
    setState(() {
      timeRemainingInSeconds = _countTimerSeconds;
    });
    _timer =
        Timer.periodic(const Duration(seconds: tickDurationInSeconds), (timer) {
      setState(() {
        timeRemainingInSeconds =
            _countTimerSeconds - (timer.tick * tickDurationInSeconds);
        if (hasEnded()) {
          timer.cancel();
        }
      });
    });
  }

  bool hasEnded() {
    if (_countTimerSeconds > 600) {
      _timer?.cancel();
      return false;
    }
    return timeRemainingInSeconds <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            SizedBox(
              height: PaddingDimensions.large,
            ),
            _buildTimerLabel(),
            AppMaterialButtons.textButton(
                // isLoading: true,
                text: CommonLocalizer.resendVerificationCode,
                textColor:
                    hasEnded() ? AppColors.primary_300 : AppColors.primary_75,
                onPressed: hasEnded() ? onResendSMSPressed : null,
                textDecoration: TextDecoration.underline,
                fontSize: Dimensions.normal),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerLabel() {
    if (_countTimerSeconds > 600) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .2),
        child: Text(
          "Otp Error",
          style: TextStyles.regular(
              height: 1.2,
              color: AppColors.danger_200,
              fontSize: Dimensions.normal),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Text(
        prettyRemainingTime(),
        key: const ValueKey(1),
        style: TextStyles.medium(
            color: AppColors.neutral_900, fontSize: Dimensions.normal),
      );
    }
  }

  String prettyRemainingTime() {
    if (_countTimerSeconds > 600) {
      return "00";
    }
    int sec = timeRemainingInSeconds % 60;
    int min = (timeRemainingInSeconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }

  void onResendSMSPressed() {
    print('onResendSMSPressed === >> ');
    // setState(() {
      // _resendWaitingTimeInSeconds = 30;
      // resendWaitingTimeInSeconds += 30;
    // });
    BlocProvider.of<VerificationEmailCodeCubit>(context)
        .resendVerificationCode(widget.emailVerificationCodeInput);
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
