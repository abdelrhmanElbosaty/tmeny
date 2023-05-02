import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  final Color color;
  final double strokeWidth;

  const AppProgressIndicator(
      {Key? key, this.color = AppColors.primaryColor, this.strokeWidth = 4.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: strokeWidth,
    );
  }
}
