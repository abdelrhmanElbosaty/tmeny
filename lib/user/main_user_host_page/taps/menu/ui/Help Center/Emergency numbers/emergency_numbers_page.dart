import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class EmergencyNumbersPage extends StatelessWidget {
  const EmergencyNumbersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        useCloseButton:true,
        context: context,
        title: 'Emergency Numbers',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: PaddingDimensions.normal,),
            _customRow(
              title: 'police - 999',
              onTap: () {}),
            _customRow(
                title: 'Ambulance: 997',
                onTap: () {}),
            _customRow(
                title: 'Traffic Accidents : 993',
                onTap: () {}),
            _customRow(
                title: 'Yolo Hotline: 1000',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
  Widget _customRow(
      {
        required String title,
        required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.large,vertical: PaddingDimensions.normal),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.appBackgroundColor,
                  child: Icon(
                    Iconsax.call,
                    color: AppColors.primary_300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingDimensions.large,
                  ),
                  child: Text(
                    title,
                    style: TextStyles.bold(fontSize: Dimensions.large),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
