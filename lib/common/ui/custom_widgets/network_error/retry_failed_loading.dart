import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/app_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

class RetryFailedLoading extends StatelessWidget {
  final String message;
  final String retryButtonTitle;
  final VoidCallback onRetryPressed;
  final bool isRetryLoading;

  RetryFailedLoading({
    Key? key,
    String? message,
    String? retryButtonTitle,
    required this.onRetryPressed,
    this.isRetryLoading = false,
  })  : message = message ?? "",
        retryButtonTitle = retryButtonTitle ?? CommonLocalizer.tryAgain,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/common/appLogo.png",
          height: 64,
          width: 64,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          message,
          style: TextStyles.semiBold(
              color: AppColors.textPrimaryColor, fontSize: Dimensions.large),
        ),
        const SizedBox(
          height: 16,
        ),
        AppButton.primaryButton(
          title: retryButtonTitle,
          onPressed: onRetryPressed,
          isLoading: isRetryLoading,
          horizontalPadding: 16,
        ),
      ],
    );
  }
}
