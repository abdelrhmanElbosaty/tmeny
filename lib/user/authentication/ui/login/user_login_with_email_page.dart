import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_state.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/widget/login_form_widget.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/error_message_widget.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserLoginCubit>(
      create: (context) => UserLoginCubit(),
      child: const _UserLoginPageBody(),
    );
  }
}

class _UserLoginPageBody extends StatelessWidget {
  const _UserLoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserLoginCubit, UserLoginState>(
      listenWhen: (previous, current) =>
          previous.loginState != current.loginState,
      listener: (context, state) {
        if (state.loginState.isSuccess) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          AuthenticationBloc.of(context).add(AuthenticatedEvent());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: ApplicationAppBars.defaultAppBar(
            context: context,
            title: AuthenticationLocalizer.login,
            onBackPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            useCloseButton: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingDimensions.large,
                vertical: PaddingDimensions.xLarge),
            child: Column(
              children: [
                BlocBuilder<UserLoginCubit, UserLoginState>(
                  buildWhen: (previous, current) =>
                      previous.loginState != current.loginState,
                  builder: (context, state) {
                    return ErrorMessageWidget(
                        isFailure: state.loginState.isFailure,
                        defaultMessage:
                            AuthenticationLocalizer.signUpDescription,
                        errorMessage: state.loginState.errorMessage ?? '');
                  },
                ),
                SizedBox(
                  height: Dimensions.xLarge,
                ),
                const LoginForm(),
                SizedBox(
                  height: PaddingDimensions.large,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AuthenticationLocalizer.dontHaveAnAccount,
                      style: TextStyles.regular(
                        fontSize: Dimensions.normal,
                        color: AppColors.neutral_900,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AuthenticationLocalizer.signUp,
                        style: TextStyles.bold(
                          fontSize: Dimensions.normal,
                          color: AppColors.primary_300,
                          textDecoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
