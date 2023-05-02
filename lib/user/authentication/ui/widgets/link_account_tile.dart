import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_icons/app_icons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

import '../../../../common/utils/localization/common_localizer.dart';

class LinkAccountTile extends StatelessWidget {
  const LinkAccountTile(
      {Key? key,
        required this.onPress,
        required this.leadingIcon,
        required this.isLinked,
        required this.text,
        this.leadingIconColor})
      : super(key: key);
  final VoidCallback onPress;
  final String leadingIcon;
  final Color? leadingIconColor;
  final String text;
  final bool isLinked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: PaddingDimensions.xLarge,
          vertical: PaddingDimensions.normal),
      padding: EdgeInsets.symmetric(
          horizontal: PaddingDimensions.large,
          vertical: PaddingDimensions.normal + 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.forthColor),
      child: Row(
        children: [
          AppIcons(
            imagePath: leadingIcon,
            color: leadingIconColor,
          ),
          SizedBox(
            width: PaddingDimensions.large,
          ),
          Expanded(
              child: Text(
                text,
                style: TextStyles.semiBold(
                  fontSize: Dimensions.normal,
                  color: AppColors.blackColor,
                ),
              )),
          GestureDetector(
            onTap: onPress,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.appBackgroundColor,
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.all(PaddingDimensions.normal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      isLinked ? Iconsax.trash : Iconsax.link,
                      size: 18,
                      color: isLinked
                          ? AppColors.danger_500
                          : AppColors.primary_300,
                    ),
                    SizedBox(
                      width: PaddingDimensions.small,
                    ),
                    Text(
                      isLinked
                          ? CommonLocalizer.remove
                          : CommonLocalizer.addLink,
                      style: TextStyles.medium(
                          color: isLinked
                              ? AppColors.danger_500
                              : AppColors.primary_300,
                          fontSize: Dimensions.normal),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
