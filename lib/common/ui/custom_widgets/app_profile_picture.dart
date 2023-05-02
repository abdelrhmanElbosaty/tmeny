import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class AppProfilePicture extends StatelessWidget {
  final double size;
  final String profilePicture;
  final bool withBorder;

  const AppProfilePicture({
    Key? key,
    this.size = 128,
    required this.profilePicture,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(
              color: AppColors.danger_600,
              width: withBorder ? 2 : 0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(
          profilePicture,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "images/main_consultant/dummyProfilePhoto.png",
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
