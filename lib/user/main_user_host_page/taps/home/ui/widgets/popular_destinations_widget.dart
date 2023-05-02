import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_network_image.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class PopularDestinationsListView extends StatelessWidget {
  const PopularDestinationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
      child: SizedBox(
        height:140,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _defultColumnTitleAndImage(
              context: context,
              image:
              'https://wallpaperaccess.com/full/854620.jpg',
              title: 'Jeddah',
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: 20,
        ),
      ),
    );
  }
  Widget _defultColumnTitleAndImage(
      {required String image,
        required String title,
        required BuildContext context}) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppNetworkImage(
            image: image,
          ),
        ),
        SizedBox(
          height: PaddingDimensions.large,
        ),
        Text(
          title,
          style: TextStyles.medium(
            fontSize: Dimensions.large,
            color: AppColors.textSecondColor,
          ),
        ),
      ],
    );
  }
}
