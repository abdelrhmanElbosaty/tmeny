import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/Help%20Center/Emergency%20numbers/emergency_numbers_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/Help%20Center/FAQs/faqs_page.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        useCloseButton: true,
        context: context,
        title: 'Help Center',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: PaddingDimensions.normal,
            ),
            _customRow(
                icon: Iconsax.call, title: 'Yolo Hotline: 1000', onTap: () {}),
            _customRow(
                icon: Iconsax.like_tag,
                title: 'customer support',
                subTitle:
                    'Range of customer services to assist customers in making cost-effective and correct use of a product.',
                onTap: () {}),
            _customRow(
                icon: Iconsax.message_question,
                title: 'FAQs',
                subTitle:
                    'A frequently asked questions (FAQs) list is often used in articles and websites.',
                onTap: () => pushMaterialPage(context, const FAQs(),
                    rootNavigator: true,)),
            _customRow(
              icon: Iconsax.call,
              title: 'Emergency numbers ',
              subTitle:
                  'Here is a list of numbers of all emergency contact numbers to call.',
              onTap: () => pushMaterialPage(
                context,
                const EmergencyNumbersPage(),
                rootNavigator: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customRow(
      {required IconData icon,
      required String title,
      String? subTitle,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PaddingDimensions.large,
          vertical: PaddingDimensions.normal),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.forthColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(PaddingDimensions.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.appBackgroundColor,
                  child: Icon(
                    icon,
                    color: AppColors.primary_300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingDimensions.large,
                  ),
                  child: Text(
                    title,
                    style: TextStyles.bold(fontSize: Dimensions.large),
                  ),
                ),
                subTitle != null
                    ? Text(
                        subTitle,
                        style: TextStyles.regular(
                            fontSize: Dimensions.large,
                            color: AppColors.firstGreyColor),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
