import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class UserHomeDrawer extends StatelessWidget {
  const UserHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingDimensions.xLarge,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _profileData(),
                SizedBox(
                  height: PaddingDimensions.xLarge,
                ),
                const Divider(height: 1),
                _customDrawerRow(
                    title: 'Favourite', onTap: () {}, icon: Iconsax.heart),
                _customDrawerRow(
                    title: 'My Wallet', onTap: () {}, icon: Iconsax.wallet_3),
                _customDrawerRow(
                    title: 'Emergency numbers',
                    onTap: () {},
                    icon: Iconsax.call),
                _customDrawerRow(
                    title: 'share the app', onTap: () {}, icon: Iconsax.share),
                _customDrawerRow(
                    title: 'Privacy and policy',
                    onTap: () {},
                    icon: Iconsax.security),
                _customDrawerRow(
                    title: 'Terms of use', onTap: () {}, icon: Iconsax.info_circle),
                const SizedBox(
                  height: 150,
                ),
                _logOutIcon(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customDrawerRow({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: PaddingDimensions.large),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.neutral_900,
            ),
            SizedBox(
              width: PaddingDimensions.xLarge,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyles.semiBold(
                  fontSize: Dimensions.large,
                  color: AppColors.neutral_900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logOutIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            AuthenticationBloc.of(context).add(LoggedOutEvent());
          },
          icon: const Icon(
            color: Colors.black,
            Iconsax.logout,
          ),
        ),
        Text(
          'Logout',
          style: TextStyles.semiBold(
              color: AppColors.neutral_900, fontSize: Dimensions.large),
        ),
      ],
    );
  }

  Widget _profileData() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.forthColor,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            'assets/images/leading_image.png',
            height: 60,
            width: 60,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingDimensions.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sam Doe',
                style: TextStyles.semiBold(
                  color: AppColors.textSecondColor,
                  fontSize: Dimensions.xLarge,
                ),
              ),
              SizedBox(
                height: PaddingDimensions.normal,
              ),
              Text(
                'Edit Profile',
                style: TextStyles.regular(
                  color: AppColors.textSecondColor,
                  fontSize: Dimensions.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
