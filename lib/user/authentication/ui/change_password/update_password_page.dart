import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_bloc.dart';
import 'package:tmeny_flutter/common/blocs/authentication/authentication_events.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_alerts/app_alert.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/utils/validation/validation_rules.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/change_password/update_password_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/change_password/update_password_state.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_text_field_tile.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/error_message_widget.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({Key? key, required this.input}) : super(key: key);
  final VerificationCodeInput input;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserUpdatePasswordCubit(),
      child: _UpdatePasswordPageBody(
        input: input,
      ),
    );
  }
}

class _UpdatePasswordPageBody extends StatefulWidget {
  const _UpdatePasswordPageBody({Key? key, required this.input})
      : super(key: key);
  final VerificationCodeInput input;

  @override
  State<_UpdatePasswordPageBody> createState() =>
      _UpdatePasswordPageBodyState();
}

class _UpdatePasswordPageBodyState extends State<_UpdatePasswordPageBody> {
  String? _newPassword;
  String? _confirmPassword;
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    _checkIfButtonEnabled();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: ApplicationAppBars.defaultAppBar(
          context: context,
          title: AuthenticationLocalizer.changePassword,
          useCloseButton: true),
      body: BlocConsumer<UserUpdatePasswordCubit, UserUpdatePasswordState>(
        listener: (context, state) {
          if (state.updatePasswordState.isSuccess) {
            AppAlerts.successAlertDialog(context,
                showCloseButton: false,
                canPop: false,
                onPressSuccess: _onUpdatePasswordSuccess,
                subTitle: CommonLocalizer.yourPasswordChanged);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingDimensions.large,
                vertical: PaddingDimensions.large),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ErrorMessageWidget(
                      isFailure: state.updatePasswordState.isFailure,
                      defaultMessage:
                          AuthenticationLocalizer.changePasswordDescription,
                      errorMessage:
                          state.updatePasswordState.errorMessage ?? ''),
                  SizedBox(
                    height: PaddingDimensions.xxLarge,
                  ),
                  AppTextFieldTile(
                    label: AuthenticationLocalizer.newPassword,
                    hintText: AuthenticationLocalizer.newPasswordHint,
                    onchange: _changeNewPassword,
                    obscureText: true,
                    validator: (password) => _passwordValidator(password),
                  ),
                  AppTextFieldTile(
                    label: AuthenticationLocalizer.surePassword,
                    hintText: AuthenticationLocalizer.confirmPasswordHint,
                    onchange: _changeConfirmPassword,
                    obscureText: true,
                    validator: (password) => _passwordValidator(password),
                  ),
                  SizedBox(
                    height: PaddingDimensions.large,
                  ),
                  AppMaterialButtons.primaryButton(
                      isLoading: state.updatePasswordState.isLoading,
                      text: AuthenticationLocalizer.changePassword,
                      onPressed: _isButtonEnabled ? _updatePasswordFun : null),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onUpdatePasswordSuccess() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    AuthenticationBloc.of(context).add(AuthenticatedEvent());
  }

  void _checkIfButtonEnabled() {
    if (_newPassword != null &&
        _newPassword!.isNotEmpty &&
        _confirmPassword != null &&
        _confirmPassword!.isNotEmpty) {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }

  void _updatePasswordFun() {
    final bool isValidate = _formKey.currentState?.validate() ?? false;

    if (isValidate) {
      final UserUpdatePasswordInput input = UserUpdatePasswordInput(
          email: widget.input.email,
          newPassword: _newPassword!,
          confirmPassword: _confirmPassword!,
          code: widget.input.verificationCode);
      BlocProvider.of<UserUpdatePasswordCubit>(context).updatePassword(input);
    }
  }

  void _changeNewPassword(String password) {
    _newPassword = password;
    setState(() {});
  }

  void _changeConfirmPassword(String password) {
    _confirmPassword = password;
    setState(() {});
  }

  String? _passwordValidator(String? password) =>
      Validation(password).passwordValidation();
}
