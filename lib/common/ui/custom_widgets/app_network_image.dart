import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';

class AppNetworkImage extends StatelessWidget {
  final String image;
  final Color placeholderColor;
  final BoxFit fit;
  final double? height;
  final double? width;

   const AppNetworkImage({
    Key? key,
    required this.image,
    this.placeholderColor = AppColors.primaryColor,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      width: width,
      height: height,
      placeholder: "assets/images/place_holder3.png",
      image: image,
      placeholderErrorBuilder: (context, error, stackTrace) {
        return Container(
          color: placeholderColor,
        );
      },
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          alignment: Alignment.center,
          color: AppColors.forthColor,
          child: Text(
            CommonLocalizer.noImageFound,
            textAlign: TextAlign.center,
            style: TextStyles.regular(
                color: AppColors.neutral_50,
                fontSize: Dimensions.normal),
          ),
        );
      },
      fit: fit,
    );
  }
}
