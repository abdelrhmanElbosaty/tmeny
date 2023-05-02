import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_network_image.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class PopularExperiences extends StatelessWidget {
  const PopularExperiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
      child: SizedBox(
        height: 400,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _defultItem(
              context: context,
              image: 'https://wallpaperaccess.com/full/45870.jpg',),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: 20,
        ),
      ),
    );
  }

  Widget _defultItem({required String image, required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 220,
                width: 280,
                child: AppNetworkImage(
                  image: image,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(PaddingDimensions.large),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF96847),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'GUIDED',
                          style: TextStyles.regular(
                            color: AppColors.forthColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: AppColors.forthColor, width: 3)),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.forthColor.withOpacity(.5),
                        child: const Icon(
                          Icons.favorite_border,
                          color: AppColors.forthColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 280,
          decoration: const BoxDecoration(color: AppColors.forthColor),
          child: Padding(
            padding: EdgeInsets.all(PaddingDimensions.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 18,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.2),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xFFFAB141),
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      '4.5 (56)',
                      style: TextStyles.regular(
                          fontSize: Dimensions.normal,
                          color: AppColors.neutral_900),
                    ),
                  ],
                ),
                SizedBox(height: PaddingDimensions.xLarge,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingDimensions.small,
                  ),
                  child: Text(
                    'Jeddah Historical and City Tour',
                    style: TextStyles.semiBold(
                        fontSize: Dimensions.large,
                        color: AppColors.neutral_900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingDimensions.small,
                  ),
                  child: Text(
                    '8 Hours - Pickup available',
                    style: TextStyles.bold(
                        fontSize: Dimensions.large,
                        color: AppColors.neutral_600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingDimensions.small,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.location,
                        color: AppColors.neutral_900,
                      ),
                      Text(
                        'Jeddah',
                        style: TextStyles.bold(
                            fontSize: Dimensions.large,
                            color: AppColors.neutral_900),
                      ),
                      const Spacer(),
                      Text(
                        '100 SAR',
                        style: TextStyles.bold(
                            color: AppColors.neutral_900,
                            fontSize: Dimensions.large),
                      ),
                      Text(
                        '/person',
                        style: TextStyles.regular(
                            color: AppColors.neutral_600,
                            fontSize: Dimensions.small),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
