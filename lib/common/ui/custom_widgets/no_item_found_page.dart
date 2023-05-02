import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class NoItemFoundPage extends StatelessWidget {
 final String image;
 final String title;
 final String subTitle;
 final String buttonTitle;
 final VoidCallback onPressedButton;

  const NoItemFoundPage({Key? key, required this.image, required this.title, required this.subTitle, required this.buttonTitle, required this.onPressedButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.xxLarge),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 235,
              width: 205,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: PaddingDimensions.large,),
              child: Text(
                title,
                style: TextStyles.bold(fontSize: Dimensions.xLarge),
              ),
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyles.medium(fontSize: Dimensions.normal),
            ),
            SizedBox(height: PaddingDimensions.large,),
            AppMaterialButtons.primaryButton(
              onPressed: onPressedButton,
              isExpanded: false,
              text: buttonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
