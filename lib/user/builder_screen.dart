import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_states.dart';
import 'package:tmeny_flutter/common/ui/splash_page/splash_page.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_progress/app_alert_loader.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/authentication/ui/auth_start_page.dart';
import 'package:tmeny_flutter/user/main_user_host_page/main_user_host_page.dart';
import 'package:tmeny_flutter/user/user_walkthrough/ui/user_walkthrow.dart';
import '../common/utils/app_material/app_snack_bars/app_snackbars.dart';

class UserBuilderScreen extends StatelessWidget  {
  const UserBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthState>(
      // listenWhen: (previous, current) => previous is LogOutState != current is LogOutState,
      listener: (context, state) {
        if (state is AuthLoading) {
          AppAlertProgress.showLoader(context, useRootNavigator: true);
        }
        if (state is LogOutState) {
          Navigator.of(context, rootNavigator: true)
              .popUntil((route) => route.isFirst);
        }
        if (state is AuthFailure) {
          Navigator.of(context, rootNavigator: true)
              .popUntil((route) => route.isFirst);
          AppSnackBars.error(context, title: state.errorMessage.toString());
        }
      },
      builder: (context, state) {
        Dimensions.isMobile = MediaQuery.of(context).size.shortestSide < 600;
        if (Dimensions.isMobile) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        }
        final Widget root;
        if (state is AuthUninitialized) {
          root = const Splash();
        } else if (state is AuthUnauthenticated || state is LogOutState) {
          root = const UserWalkThrowPage();
        } else if (state is AuthLogInPage) {
          root = const AuthenticationStartPage();
        } else {
          root = const MainUserHostPage();
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Container(
            color: AppColors.neutralBackground,
            key: ValueKey(state),
            child: root,
          ),
        );
      },
    );
  }
}
