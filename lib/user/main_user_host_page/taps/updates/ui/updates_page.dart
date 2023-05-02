import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class UserUpdatesPage extends StatelessWidget {
  const UserUpdatesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        centerTitle: true,
        title: 'Updates',
      ),
      body: Padding(
        padding:  EdgeInsets.all(PaddingDimensions.large),
        child: ListView.separated(
          itemBuilder: (context, index) => const UpdateNotification(),
          separatorBuilder: (context, index) => SizedBox(
            height: PaddingDimensions.large,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
class UpdateNotification extends StatelessWidget {
  const UpdateNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.forthColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingDimensions.large,
                vertical: PaddingDimensions.small),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: AppColors.appBackgroundColor,
                  child: Icon(
                    Iconsax.notification,
                    color: AppColors.primary_300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Please update your bank details Please update your bank details',
                    style: TextStyles.medium(
                      fontSize: Dimensions.large,
                    ),
                  ),
                  SizedBox(
                    height: PaddingDimensions.large,
                  ),
                  Text(
                    '2 Minute ago',
                    style: TextStyles.medium(
                      fontSize: Dimensions.small,
                      color: AppColors.secondGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}