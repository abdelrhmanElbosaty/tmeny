import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_icons/app_icons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      toolbarHeight: Dimensions.toolbarHeight+20,
      elevation: 0,
      backgroundColor: AppColors.forthColor,
      shadowColor: Colors.transparent,
      title: Image.asset(
        'assets/images/logo.png',
        width: 130,
      ),
      leading: Row(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/leading_image.png',
            height: 36,
            width: 36,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
          child: const AppIcons(imagePath: IconsPaths.search),
        ),
      ],
    );
  }
}
