import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:tmeny_flutter/common/base/localization/app_languages.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_bloc.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_event.dart';
import 'package:tmeny_flutter/common/blocs/app_language/app_language_state.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localization.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localization.dart';
import 'package:tmeny_flutter/user/builder_screen.dart';
import 'package:tmeny_flutter/user/common/utils/localization/user_common_localization.dart';
import 'package:tmeny_flutter/user/user_walkthrough/utils/localization/walkthrough_localization.dart';

class TheAppUser extends StatelessWidget {
  const TheAppUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                return AppLanguageBloc(injector())
                  ..add(AppLanguageAppStarted());
              },
            ),
            BlocProvider(create: (context) => AuthenticationBloc()),
          ],
          child: BlocBuilder<AppLanguageBloc, AppLanguageState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: MaterialApp(
                  key: ValueKey(state.locale.languageCode),
                  debugShowCheckedModeBanner: false,
                  color: AppColors.appBackgroundColor,
                  theme: ThemeData(
                    scaffoldBackgroundColor: AppColors.appBackgroundColor,
                    fontFamily: 'LamaSans',
                    primaryColor: AppColors.primaryColor,
                  ),
                  locale: state.locale,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    CommonLocalization.delegate,
                    AuthenticationLocalization.delegate,
                    UserCommonLocalization.delegate,
                    WalkthroughLocalization.delegate,
                  ],
                  supportedLocales: AppLanguages.supportedLocales,
                  title: "Yolo",
                  home:  const UserBuilderScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
