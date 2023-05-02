import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class AlertDialogOTPError extends StatelessWidget {
  const AlertDialogOTPError({Key? key}) : super(key: key);

  static void showAlertDialogOTPError(context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: AlertDialogOTPError(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {//todo:Localization
    return Text(
      'AuthenticationLocalizer.otpError',
      style: TextStyles.regular(fontSize: Dimensions.large),
    );
  }
}
