import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

import '../../../domain/use_cases/otp/handle_otp_use_case.dart';


class OtpAlerts extends StatefulWidget {
  final OTP otp;

  const OtpAlerts({Key? key, required this.otp}) : super(key: key);

  static void blockedOtp(context, {required OTP otp}) {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(content: OtpAlerts(otp: otp)));
      },
    );
  }

  @override
  State<OtpAlerts> createState() => _OtpAlertsState();
}

class _OtpAlertsState extends State<OtpAlerts> {
  Timer? timer;
  int timeRemainingInSeconds = 0;
  int blockTime = 0;
  final dateNow = DateTime.now();
  Duration? duration;

  @override
  void initState() {
    duration = widget.otp.firstOTPTime
        .add(  const Duration(minutes: blocOtpDurationInMinutes))
        .difference(dateNow);
    blockTime = (duration?.inSeconds ?? 0);
    timeRemainingInSeconds = blockTime;
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      blockTime--;
      timeRemainingInSeconds = blockTime;
      if (timeRemainingInSeconds >= 0) {
        setState(() {
          timeRemainingInSeconds;
        });
      } else {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  String prettyRemainingTime() {
    int sec = timeRemainingInSeconds % 60;
    int min = (timeRemainingInSeconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          CommonLocalizer.otpBlocked,
          textAlign: TextAlign.center,
          style: TextStyles.medium(
            height: 1.5,
            fontSize: Dimensions.large,
          ),
        ),
        SizedBox(
          height: PaddingDimensions.large,
        ),
        Text(
          prettyRemainingTime(),
          textAlign: TextAlign.center,
          style: TextStyles.medium(
            height: 1.5,
            fontSize: Dimensions.large,
          ),
        ),
        SizedBox(
          height: PaddingDimensions.xLarge,
        ),
        AppMaterialButtons.primaryButton(
          height: 40,
            text: CommonLocalizer.ok, onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}
