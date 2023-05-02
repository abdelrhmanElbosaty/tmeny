import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.onTap,
      this.icon,
      this.leading, this.subTitle})
      : super(key: key);
  final String title;
  final String? subTitle;
  final VoidCallback onTap;
  final IconData? icon;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: AppColors.neutral_20,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: PaddingDimensions.large,horizontal: PaddingDimensions.xLarge),
        child: Row(
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: AppColors.neutral_900,
                  )
                : leading != null
                    ? leading!
                    : const SizedBox(),
            SizedBox(
              width: PaddingDimensions.large,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold(
                      fontSize: Dimensions.large,
                      color: AppColors.neutral_900,
                    ),
                  ),
                  subTitle != null?  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      subTitle!,
                      style: TextStyles.semiBold(
                        fontSize: Dimensions.large,
                        color: AppColors.neutral_900,
                      ),
                    ),
                  ) : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
