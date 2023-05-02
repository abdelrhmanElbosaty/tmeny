import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_states.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/common/utils/localization/user_common_localizer.dart';
import 'package:tmeny_flutter/user/main_user_host_page/models/tap_item.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/booking/ui/booking_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/home/ui/home_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/menu/ui/menu_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/taps/updates/ui/updates_page.dart';
import '../../common/utils/app_material/app_icons/app_icons.dart';

class MainUserHostPage extends StatefulWidget {
  const MainUserHostPage({Key? key}) : super(key: key);

  @override
  State<MainUserHostPage> createState() => _MainUserHostPageState();
}

class _MainUserHostPageState extends State<MainUserHostPage> {
  var _currentTab = MainUserTabItemType.home;

  List<MainUserTabItem> _items = [];

  List<MainUserTabItemType> loadedTabs = [];

  final Map<MainUserTabItemType, GlobalKey<NavigatorState>> _navigatorKeys = {
    MainUserTabItemType.home: GlobalKey<NavigatorState>(),
    MainUserTabItemType.bookings: GlobalKey<NavigatorState>(),
    MainUserTabItemType.updates: GlobalKey<NavigatorState>(),
    MainUserTabItemType.menu: GlobalKey<NavigatorState>(),
  };

  final _tabsAuthenticationNeeded = [];

  void initItems() {
    _items = [
      MainUserTabItem(
        title: UserCommonLocalizer.home,
        image: _currentTab != MainUserTabItemType.home
            ? IconsPaths.home
            : IconsPaths.homeFill,
        type: MainUserTabItemType.home,
        isSelected: _currentTab == MainUserTabItemType.home,
      ),
      MainUserTabItem(
        title: UserCommonLocalizer.bookings,
        image: _currentTab != MainUserTabItemType.bookings
            ? IconsPaths.booking
            : IconsPaths.bookingFill,
        type: MainUserTabItemType.bookings,
        isSelected: _currentTab == MainUserTabItemType.bookings,
      ),
      MainUserTabItem(
        title: UserCommonLocalizer.updates,
        image: _currentTab != MainUserTabItemType.updates
            ? IconsPaths.updates
            : IconsPaths.updatesFill,
        type: MainUserTabItemType.updates,
        isSelected: _currentTab == MainUserTabItemType.updates,
      ),
      MainUserTabItem(
        title: UserCommonLocalizer.menu,
        image: _currentTab != MainUserTabItemType.menu
            ? IconsPaths.menu
            : IconsPaths.menuFill,
        type: MainUserTabItemType.menu,
        isSelected: _currentTab == MainUserTabItemType.menu,
      ),
    ];
  }

  void _onTabSelected(int selected) {
    final bool isAuthenticated =
        BlocProvider.of<AuthenticationBloc>(context).state is AuthAuthenticated;

    if (_tabsAuthenticationNeeded
            .contains(MainUserTabItemType.values[selected]) &&
        !isAuthenticated) {
      // showErrorSnackBar(context, AuthenticationLocalizer.pleaseLoginFirst);
      // showAppHandelMessageBottomSheet(context,
      //     subTitle: 'AuthenticationLocalizer.pleaseLoginFirst', title: null);
    }

    if (selected == _currentTab.index) {
      _navigatorKeys[MainUserTabItemType.values[selected]]
          ?.currentState
          ?.popUntil((route) {
        return route.isFirst;
      });
    } else {
      setState(() {
        _currentTab = MainUserTabItemType.values[selected];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initItems();
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInTab =
            !(_navigatorKeys[_currentTab]?.currentState?.canPop() ?? false);

        if (isFirstRouteInTab && _currentTab != MainUserTabItemType.home) {
          _onTabSelected(MainUserTabItemType.home.index);
          return false;
        }

        if (!isFirstRouteInTab) {
          _navigatorKeys[_currentTab]?.currentState?.maybePop();
        }

        return isFirstRouteInTab;
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(MainUserTabItemType.home),
            _buildOffstageNavigator(MainUserTabItemType.bookings),
            _buildOffstageNavigator(MainUserTabItemType.updates),
            _buildOffstageNavigator(MainUserTabItemType.menu),
            PositionedDirectional(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).padding.bottom * .7) + 64,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppColors.neutral_60.withOpacity(0.25),
                        blurRadius: 15.0,
                        offset: const Offset(0, -5))
                  ],
                  color: AppColors.forthColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: _makeBottomNave(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(MainUserTabItemType itemType) {
    if (_currentTab == itemType) {
      _addCurrentTabAsLoaded();
    }

    return Offstage(
      offstage: _currentTab != itemType,
      child: _isTabLoaded(itemType) ? _buildNavigator(itemType) : Container(),
    );
  }

  bool _isTabLoaded(MainUserTabItemType itemType) {
    return loadedTabs.contains(itemType);
  }

  void _addCurrentTabAsLoaded() {
    if (_shouldAddCurrentTabAsLoaded()) {
      loadedTabs.add(_currentTab);
    }
  }

  bool _shouldAddCurrentTabAsLoaded() {
    return !loadedTabs.contains(_currentTab);
  }

  Widget _buildNavigator(MainUserTabItemType itemType) {
    return Navigator(
      key: _navigatorKeys[itemType],
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => _routeForItemType(itemType, routeSettings));
      },
    );
  }

  Widget _makeBottomNave() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _items
          .map((item) => _buildTabItem(
                item,
                () => _onNaveItemTaped(item.type),
              ))
          .toList(),
    );
  }

  void _onNaveItemTaped(MainUserTabItemType type) {
    switch (type) {
      case MainUserTabItemType.home:
        _currentTab = type;
        break;
      case MainUserTabItemType.bookings:
        _currentTab = type;
        break;
      case MainUserTabItemType.updates:
        _currentTab = type;
        break;
      case MainUserTabItemType.menu:
        _currentTab = type;
        break;
    }
    setState(() {});
  }

  Widget _routeForItemType(
      MainUserTabItemType itemType, RouteSettings routeSettings) {
    switch (itemType) {
      case MainUserTabItemType.home:
        return UserHomePage();
      case MainUserTabItemType.bookings:
        return const UserBookingPage();
      case MainUserTabItemType.updates:
        return const UserUpdatesPage();
      case MainUserTabItemType.menu:
        return const UserMenuPage();
    }
  }

  Widget _buildTabItem(MainUserTabItem item, VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            item.image?.isEmpty ?? false
                ? const SizedBox()
                : AppIcons(
                    height: 24,
                    // _currentTab == item.type ? 24.2 :24
                    width: 24,
                    imagePath: item.image ?? '',
                  ),
            SizedBox(
              height: PaddingDimensions.small,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold(
                fontSize: Dimensions.small,
                color: _currentTab == item.type
                    ? AppColors.primary_300
                    : AppColors.neutral_900,
              ),
            ),
            SizedBox(
              height: PaddingDimensions.small + 2,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: PaddingDimensions.small),
                height: 1.6,
                color: _currentTab == item.type
                    ? AppColors.primary_300
                    : AppColors.forthColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom * .6,
            )
          ],
        ),
      ),
    );
  }
}
