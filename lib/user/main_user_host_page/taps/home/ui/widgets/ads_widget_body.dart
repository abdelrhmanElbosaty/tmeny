import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_network_image.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';

class AdsBodyWithCoupon extends StatelessWidget {
  const AdsBodyWithCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo:Localization
    return  SizedBox(
      height: 250,
      width:double.infinity,
      child: Stack(
        children: [
          const AppNetworkImage(
            width:double.infinity,
            height: 250,
            fit: BoxFit.fill,
            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJoHCLL6HdxjGrp41zKCpCOqIPuYshOhj0qw&usqp=CAU',
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: PaddingDimensions.large,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '30% OFF! ',
                    style: TextStyles.bold(
                        fontSize: 20, color: AppColors.forthColor),
                  ),
                  Text(
                    'Get 30% OFF your first booking when you use this code at checkout',
                    style: TextStyles.medium(
                        fontSize: 10, color: AppColors.forthColor),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: PaddingDimensions.large),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: PaddingDimensions.normal,
                        horizontal: PaddingDimensions.xLarge,
                      ),
                      decoration: BoxDecoration(
                        color:
                        AppColors.forthColor.withOpacity(.22),
                        // border: Border.all(color: AppColors.forthColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: (){},
                        child: SizedBox(
                          width: 110,
                          child: Row(
                            children: [
                              Text(
                                'YOLO2023',
                                style: TextStyles.medium(
                                    color: AppColors.neutral_0,
                                    fontSize: Dimensions.normal),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.copy,
                                color: AppColors.forthColor,
                              ),
                            ],
                          ),
                        ),
                      ),
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
