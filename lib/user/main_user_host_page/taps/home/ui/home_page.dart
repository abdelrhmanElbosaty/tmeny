import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_icons/app_icons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';
import 'widgets/ads_widget_body.dart';
import 'widgets/popular_destinations_widget.dart';
import 'widgets/popular_experiences_widget.dart';

// ignore: must_be_immutable
class UserHomePage extends StatelessWidget {
  UserHomePage({Key? key}) : super(key: key);

  Completer<void>? completer;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: Dimensions.toolbarHeight + 20,
        elevation: 0,
        backgroundColor: AppColors.forthColor,
        shadowColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo.png',
          width: 130,
        ),
        leading: Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.forthColor,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  'assets/images/leading_image.png',
                  height: 45,
                  width: 45,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
            child: const AppIcons(imagePath: IconsPaths.search),
          ),
        ],
      ),
      // drawer: Container(
      //     clipBehavior: Clip.antiAliasWithSaveLayer,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(40),
      //     ),
      //     child: const UserHomeDrawer()),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const AdsBodyWithCoupon(),
                _defultRowViewAll(
                  title: 'Popular Destinations',
                  onTap: () {},
                ),
                const PopularDestinationsListView(),
                _defultRowViewAll(
                  title: 'Popular Experiences',
                  onTap: () {},
                ),
                const PopularExperiences(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _defultRowViewAll({
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.all(
        PaddingDimensions.large,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyles.medium(
              fontSize: 14,
              color: AppColors.blackColor,
            ),
          ),
          const Spacer(),
          Text(
            'view all',
            style: TextStyles.medium(
              fontSize: 12,
              color: AppColors.blackColor,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Future<void> onRefresh() async {
    completeRefresh();
    completer = Completer();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        completeRefresh();
      },
    );
    return completer!.future;
  }

  void completeRefresh() {
    if (!(completer?.isCompleted ?? true)) {
      completer?.complete();
    }
  }
}
