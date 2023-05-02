import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class AppAlertProgress extends StatelessWidget {
  const AppAlertProgress(
      {Key? key,
      this.color = AppColors.primaryColor,
      this.progressStrokeWidth = 4.0})
      : super(key: key);

  final Color color;
  final double progressStrokeWidth;

  static void showLoader(context, {bool useRootNavigator = true}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return const AppAlertProgress();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.forthColor,
              borderRadius: BorderRadius.circular(8)),
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: progressStrokeWidth,
          ),
        ),
      ),
    );
  }
}
