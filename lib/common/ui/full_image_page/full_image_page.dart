import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/icon_button.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/navigation/animated_navigation.dart';

class FullImagePage extends StatelessWidget {
  final File image;
  final String title;

  const FullImagePage({Key? key, required this.image, required this.title})
      : super(key: key);

  static void navigate(context, {required File image}) =>
      Navigator.of(context).push(FadeTransitionRoute(FullImagePage(
        image: image,
        title: "Profile Image",
      )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.forthColor,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconsButton(
          onPressed: () => Navigator.of(context).pop(),
          buttonIcon: Icons.arrow_back,
          textColor: AppColors.primaryColor,
        ),
        title: Text(
          title,
          style: TextStyles.semiBold(color: AppColors.primaryColor),
        ),
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 0.5,
        maxScale: 4,
        scaleEnabled: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: AppColors.appBackgroundColor,
          width: MediaQuery.of(context).size.width,
          child: Hero(
            tag: image,
            child: Image.file(image),
          ),
        ),
      ),
    );
  }
}
