import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/app_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';


// ignore: must_be_immutable
class RetryFailedLoading extends StatelessWidget {
  final String message;
  final String retryButtonTitle;
  final VoidCallback onRetryPressed;
  final bool isRetryLoading;
  bool isFailedWidget = true;

  RetryFailedLoading({
    Key? key,
    String? message,
    String? retryButtonTitle,
    required this.onRetryPressed,
    this.isRetryLoading = false,
    this.isFailedWidget = true,
  })  : message = message ?? "",
        retryButtonTitle = retryButtonTitle ?? '',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/common/network_error.png",
          scale: 3,
        ),
        SizedBox(
          height: PaddingDimensions.large,
        ),
        Text(
          message,
          style: TextStyles.regular(
            color: AppColors.neutral_900,
          ),
        ),
        SizedBox(
          height: PaddingDimensions.xxLarge,
        ),
        isFailedWidget
            ? AppButton.primaryButton(
                isShadow: false,
                title: retryButtonTitle,
                onPressed: onRetryPressed,
                isLoading: isRetryLoading,
                isBold: true,
                fontSize: Dimensions.xLarge,
                horizontalPadding: PaddingDimensions.xxxxLarge,
              )
            : const SizedBox(),
      ],
    );
  }
}
