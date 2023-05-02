import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_snack_bars/app_snackbars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/Images_path.dart';
import 'package:tmeny_flutter/common/utils/assets_paths/icons_paths.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/register_page.dart';
import 'package:tmeny_flutter/user/authentication/ui/social_login/social_login_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/social_login/social_login_state.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';
import 'package:tmeny_flutter/user/common/utils/localization/user_common_localizer.dart';
import '../../../common/utils/app_material/app_progress/app_alert_loader.dart';
import 'widgets/login_button.dart';

class AuthenticationStartPage extends StatelessWidget {
  const AuthenticationStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: const _AuthenticationStartBody(),
    );
  }
}

class _AuthenticationStartBody extends StatefulWidget {
  const _AuthenticationStartBody({Key? key}) : super(key: key);

  @override
  State<_AuthenticationStartBody> createState() =>
      _AuthenticationStartPageState();
}

class _AuthenticationStartPageState extends State<_AuthenticationStartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialLoginCubit, SocialLoginState>(
      listener: (context, state) {
        if (state.socialLogin.isLoading) {
          AppAlertProgress.showLoader(context);
        }
        if (state.socialLogin.isFailure) {
          Navigator.pop(context);
          AppSnackBars.hint(context,
              title: state.socialLogin.errorMessage ?? '',
              icon: Iconsax.info_circle);
        }
        if (state.socialLogin.isSuccess) {
          Navigator.pop(context);
          _onLoginSuccess();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(PaddingDimensions.xLarge),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: PaddingDimensions.xxLarge,
                  ),
                  SizedBox(
                    height: PaddingDimensions.xxLarge,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: AuthenticationLocalizer.welcomeTo,
                        style: TextStyles.regular(color: AppColors.neutral_800,fontSize: Dimensions.xxLarge)),
                    TextSpan(
                        text: UserCommonLocalizer.appName,
                        style: TextStyles.bold(color: AppColors.neutral_800,fontSize: Dimensions.xxLarge))
                  ])),
                  SizedBox(
                    height: PaddingDimensions.normal,
                  ),

                  Text(
                    AuthenticationLocalizer.descriptionSubText,
                    softWrap: true,
                    style: TextStyles.regular(
                        color: AppColors.neutral_300,
                        fontSize: Dimensions.large),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: PaddingDimensions.xxxLarge,
                  ),
                  SocialButton(
                    bgColor: AppColors.neutral_50,
                    icon: IconsPaths.email,
                    iconColor: Colors.black,
                    // widgetsColor: AppColors.neutral_50,
                    textColor: Colors.black,
                    text: AuthenticationLocalizer.continueWithEmail,
                    onPress: _continueWithEmailFun,
                  ),
                  SocialButton(
                    textColor: Colors.black,
                    bgColor: AppColors.neutral_50,
                    // widgetsColor: AppColors.neutral_50,
                    icon: IconsPaths.google,
                    text: AuthenticationLocalizer.continueWithGoogle,
                    onPress: () async {
                      await _continueWithGoogleFun(context);
                    },
                  ),
                  if (Platform.isIOS) ...[
                    SocialButton(
                      icon: IconsPaths.apple,
                      text: AuthenticationLocalizer.continueWithApple,
                      bgColor: AppColors.blackColor,
                      // widgetsColor: AppColors.neutral_50,
                      textColor: Colors.white,
                      onPress: _continueWithAppleFun,
                    ),
                  ],
                  SocialButton(
                    icon: IconsPaths.facebook,
                    text: AuthenticationLocalizer.continueWithFacebook,
                    bgColor: AppColors.blueColor,
                    textColor: Colors.white,
                    // widgetsColor: AppColors.neutral_50,
                    onPress: () async {
                      await _onFacebookPressed(context);
                    },
                  ),
                  SocialButton(
                    icon: IconsPaths.twitter,
                    text: AuthenticationLocalizer.continueWithTwitter,
                    bgColor: AppColors.blueSkyColor,
                    // widgetsColor: AppColors.neutral_50,
                    textColor: Colors.white,
                    onPress: _continueWithTwitterFun,
                  ),
                  _logInAsGuestWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logInAsGuestWidget() {
    return GestureDetector(
      onTap: _continueAsGuest,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(PaddingDimensions.large),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: AppColors.primary_500,
              width: 1,
            ),
          )),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            AuthenticationLocalizer.viewCommunity,
            style: TextStyles.bold(
                color: AppColors.primary_500, fontSize: Dimensions.normal),
          ),
        ),
      ),
    );
  }

  void _onLoginSuccess() {
    // Navigator.of(context).popUntil((route) => route.isFirst);
    // if(socialInfo.isCompleted == true){
    AuthenticationBloc.of(context).add(AuthenticatedEvent());
    // }else{
    // BlocProvider.of<AuthenticationBloc>(context).add(AuthFirstNameEvent(firstNameData: FirstNameData(socialInfo.socialName, FirstNameState.social)));
    // }
  }

  void _continueWithEmailFun() =>
      pushMaterialPage(context, const RegisterPage(), rootNavigator: true);

  Future<void> _continueWithGoogleFun(BuildContext context) async {
    SocialLoginCubit.of(context).loginWithGoogle();
  }

  void _continueWithAppleFun() {}

  Future<void> _onFacebookPressed(BuildContext context) async {
    // SocialLoginCubit.of(context).loginWithFacebook();
  }

  void _continueWithTwitterFun() {}

  void _continueAsGuest() => AuthenticationBloc.of(context).add(GuestEvent());
}
