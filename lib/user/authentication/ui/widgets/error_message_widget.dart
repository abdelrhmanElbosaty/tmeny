import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(
      {Key? key,
      required this.errorMessage,
      required this.isFailure,
      this.defaultMessage})
      : super(key: key);

  final bool isFailure;
  final String errorMessage;
  final String? defaultMessage;

  @override
  Widget build(BuildContext context) {
    if (isFailure) {
      return SizedBox(
        height: 60,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: PaddingDimensions.large,
              vertical: PaddingDimensions.normal),
          decoration: BoxDecoration(
            color: AppColors.secondary_100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: AppColors.danger_600),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Iconsax.info_circle,
                color: AppColors.danger_600,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                errorMessage,
                style: TextStyles.regular(fontSize: Dimensions.normal),
              )),
            ],
          ),
        ),
      );
    }

    if (defaultMessage != null) {
      return Text(
        defaultMessage ?? '',
        style: TextStyles.regular(
          height: 1.4,
            fontSize: Dimensions.large, color: AppColors.neutral_700),
        textAlign: TextAlign.center,
      );
    }

    return const SizedBox(
      height: 60,
    );
  }
}
