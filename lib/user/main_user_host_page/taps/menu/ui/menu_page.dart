import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/language_bottom_sheet.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/link_your_account/link_your_account_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/Help%20Center/Emergency%20numbers/emergency_numbers_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/Help%20Center/help_center_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/widgets/contact_us.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/widgets/log_out_tile.dart';
import 'package:tmeny_flutter/user/user_profile/ui/user_profile_page.dart';
import '../../../../../common/ui/custom_widgets/custom_list_tile.dart';

class UserMenuPage extends StatelessWidget {
  const UserMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            _profileData(context),
            SizedBox(
              height: PaddingDimensions.xLarge,
            ),
            const Divider(height: 1),
            CustomListTile(
                title: 'Favourite', onTap: () {}, icon: Iconsax.heart),
            CustomListTile(
                title: 'My Wallet', onTap: () {}, icon: Iconsax.wallet_3),
            CustomListTile(
              title: 'Emergency numbers',
              onTap: () => pushMaterialPage(
                context,
                const EmergencyNumbersPage(),
                rootNavigator: true,
              ),
              icon: Iconsax.call,
            ),
            CustomListTile(
                title: 'share the app', onTap: () {}, icon: Iconsax.share),
            CustomListTile(
              title: 'Privacy and policy',
              onTap: () {},
              icon: Iconsax.security,
            ),
            CustomListTile(
              title: 'Terms of use',
              onTap: () {},
              icon: Iconsax.info_circle,
            ),
            CustomListTile(
              title: 'Link Your Account',
              onTap: () => pushMaterialPage(
                context,
                const LinkYourAccountPage(),
                rootNavigator: true,
              ),
              icon: Iconsax.link,
            ),
            CustomListTile(
              title: 'Language',
              onTap: () =>
                  LanguageBottomSheet.showLanguageBottomSheet(context),
              icon: Iconsax.language_square,
            ),
            CustomListTile(
              title: 'Help Center',
              onTap: () => pushMaterialPage(
                context,
                const HelpCenterPage(),
                rootNavigator: true,
              ),
              icon: Iconsax.message_question,
            ),
            CustomListTile(
              title: 'Contact Us',
              onTap: () => pushMaterialPage(
                context,
                const ContactUs(),
                rootNavigator: true,
              ),
              icon: Iconsax.message_question,
            ),
            const LogOutTile(),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileData(context) {
    return InkWell(
      onTap: () => pushMaterialPage(context, const UserProfilePage()),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.xLarge),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.forthColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/leading_image.png',
              height: 60,
              width: 60,
            ),
          ),
          Column(
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
        ],
      ),
    );
  }
}
