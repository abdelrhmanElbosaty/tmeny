import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_bloc.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_event.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/app_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/user_walkthrough/model/walkthrough_data.dart';
import 'package:tmeny_flutter/user/user_walkthrough/utils/localization/walkthrough_localizer.dart';
import 'change_language_botton.dart';
import 'smooth_page_indicator.dart';

class WalkThrowPageBody extends StatefulWidget {
  const WalkThrowPageBody({Key? key}) : super(key: key);

  @override
  State<WalkThrowPageBody> createState() => _WalkThrowPageBodyState();
}

class _WalkThrowPageBodyState extends State<WalkThrowPageBody> {
  late List<WalkThrowPageInfo> currentPageClass;
  late final PageController _pageController;
  int _currentPages = 0;

  @override
  void initState() {
    currentPageClass = WalkThrowPageViewItemsInfo().getPageInfoList();
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang =
        BlocProvider.of<AppLanguageBloc>(context).state.locale.languageCode;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: PaddingDimensions.xLarge,
              ),
              InkWell(
                onTap: () => changeLanguage(lang),
                child: ChangeLanguageBottom(
                  key: ValueKey(lang.toString()),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: currentPageClass.map(
                (element) {
                  return _pageViewBody();
                },
              ).toList(),
            ),
          ),
          SizedBox(
            height: PaddingDimensions.xxLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: PaddingDimensions.xxLarge),
            child: SmoothPageIndicatorWidget(
              pageController: _pageController,
              items: currentPageClass,
            ),
          ),
          _navigateButton(),
        ],
      ),
    );
  }

  void changeLanguage(String lang) {
    if (lang == 'ar') {
      BlocProvider.of<AppLanguageBloc>(context)
          .add(const ChangeAppLanguage(Locale.fromSubtags(languageCode: 'en')));
    } else {
      BlocProvider.of<AppLanguageBloc>(context)
          .add(const ChangeAppLanguage(Locale.fromSubtags(languageCode: 'ar')));
    }
    setState(() {});
  }

  Widget _pageViewBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.xLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            currentPageClass[_currentPages].title,
            style:
                TextStyles.bold(color: AppColors.textForthColor, fontSize: 38),
            textAlign: TextAlign.start,
            softWrap: true,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            currentPageClass[_currentPages].description,
            style: TextStyles.regular(
                color: AppColors.textForthColor, fontSize: Dimensions.large),
            textAlign: TextAlign.start,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _navigateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: PaddingDimensions.xLarge,
          horizontal: PaddingDimensions.xLarge),
      child: Column(
        children: [
          AppButton.primaryButton(
            title: _currentPages == 2
                ? WalkthroughLocalizer.buttonNameOFLastPage
                : WalkthroughLocalizer.buttonName,
            isExpanded: _currentPages == 2 ? true : false,
            isBold: true,
            onPressed: _onNavigateButtonPressed,
          ),
          Padding(
            padding:   EdgeInsets.all(Dimensions.large),
            child: Text(
              WalkthroughLocalizer.joinAsADoctor,
              style: TextStyles.boldUnderlined(
                color: AppColors.primary_500,
                fontSize: Dimensions.large
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onNavigateButtonPressed() {
    if (_currentPages < currentPageClass.length - 1) {
      _pageController.animateToPage(2,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    } else {
      AuthenticationBloc.of(context).add(OnFinishWalkThrowEvent());
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPages = page;
    });
  }
}
