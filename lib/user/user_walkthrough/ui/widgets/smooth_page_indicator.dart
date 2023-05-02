import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/user/user_walkthrough/model/walkthrough_data.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  final PageController pageController;
  final List<WalkThrowPageInfo> items;

  const SmoothPageIndicatorWidget(
      {Key? key, required this.pageController, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect:  ExpandingDotsEffect(
        paintStyle: PaintingStyle.fill,
        expansionFactor: 5,
        spacing: 8.0,
        radius: 24.0,
        dotWidth: 7,
        dotHeight: 8.0,
        dotColor: AppColors.forthColor.withOpacity(.3),
        activeDotColor: AppColors.forthColor,
      ),
    );
  }
}
