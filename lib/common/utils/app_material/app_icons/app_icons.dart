import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class AppIcons extends StatelessWidget {
  const AppIcons({Key? key, required this.imagePath, this.color, this.width, this.height})
      : super(key: key);

  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (BuildContext context) => Container(
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
              color: AppColors.appBackgroundColor, shape: BoxShape.circle),
          child: const CircularProgressIndicator()),
    );
  }
}
