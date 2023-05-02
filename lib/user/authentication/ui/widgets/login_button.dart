import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_icons/app_icons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {Key? key,
       this.bgColor,
      this.iconColor,
      this.textColor,
      required this.icon,
      required this.text,
      required this.onPress})
      : super(key: key);

  final VoidCallback onPress;
  final String text;
  final String icon;
   final Color? bgColor;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: PaddingDimensions.normal),
        alignment: Alignment.center,
        height: Dimensions.buttonHeight,
        padding: EdgeInsets.symmetric(
          horizontal: PaddingDimensions.xLarge,
        ),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.forthColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
                width: 1,color: AppColors.neutral_50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons(imagePath: icon,color: iconColor,),
            SizedBox(width: PaddingDimensions.xLarge,),
            Expanded(
                child: Text(
              text,
              // textAlign: TextAlign.center,
              style: TextStyles.medium(
                  fontSize: Dimensions.xLarge,
                  color: textColor ?? AppColors.primary_300),
            )),
          ],
        ),
      ),
    );
  }
}
