import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/register_state.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/error_message_widget.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';
import 'register_cubit.dart';
import 'widget/have_account_widget.dart';
import 'widget/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: const _RegisterPageBody(),
    );
  }
}

class _RegisterPageBody extends StatelessWidget {
  const _RegisterPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: ApplicationAppBars.defaultAppBar(
          context: context,
          title: AuthenticationLocalizer.signUp,
          useCloseButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingDimensions.large),
          child: Column(
            children: [
              SizedBox(
                height: PaddingDimensions.xLarge,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                buildWhen: (previous, current) =>
                    previous.errorMessage != current.errorMessage,
                builder: (context, state) {
                  return ErrorMessageWidget(
                      isFailure: state.errorMessage != null,
                      defaultMessage: AuthenticationLocalizer.signUpDescription,
                      errorMessage: state.errorMessage ?? '');
                },
              ),
              SizedBox(
                height: PaddingDimensions.large,
              ),
              const RegisterForm(),
              SizedBox(height: PaddingDimensions.xLarge),
              const HaveAccountWidget(),
              SizedBox(height: PaddingDimensions.xxLarge),
            ],
          ),
        ),
      ),
    );
  }
}
