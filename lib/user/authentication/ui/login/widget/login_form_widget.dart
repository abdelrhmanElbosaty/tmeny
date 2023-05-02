import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/format/input_formatters_textformfield.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/change_password/verify_email_page.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_state.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_text_field_tile.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isSignInButtonEnabled = false;
  String? _emailAddress;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _checkIfSignUpButtonEnabled();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFieldTile(
            label: AuthenticationLocalizer.email,
            hintText: AuthenticationLocalizer.emailHint,
            inputFormatters: [
              FilteringTextInputFormatter.deny(' '),
            ],
            onchange: _onEmailAddressChange,
          ),
          AppTextFieldTile(
            label: AuthenticationLocalizer.password,
            hintText: AuthenticationLocalizer.passwordHint,
            onchange: _onPasswordChange,
            obscureText: true,
          ),
          SizedBox(
            height: PaddingDimensions.large,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => pushMaterialPage(context, const VerifyEmailPage()),
                child: Text(
                  AuthenticationLocalizer.forgetPassword,
                  style: TextStyles.bold(
                      fontSize: Dimensions.normal,
                      color: AppColors.neutral_900,
                      textDecoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            height: PaddingDimensions.large,
          ),
          BlocBuilder<UserLoginCubit, UserLoginState>(
            builder: (context, state) {
              return AppMaterialButtons.primaryButton(
                  isLoading: state.loginState.isLoading,
                  text: AuthenticationLocalizer.login,
                  onPressed: _isSignInButtonEnabled ? _logInFun : null);
            },
          ),
        ],
      ),
    );
  }

  void _logInFun() {
    final bool isValidate = _formKey.currentState?.validate() ?? false;
    if (isValidate) {
      final UserLoginInput input = UserLoginInput(
        password: _password!,
        email: _emailAddress!,
      );
      BlocProvider.of<UserLoginCubit>(context).userLogin(input);
    }
  }

  void _checkIfSignUpButtonEnabled() {
    if (_emailAddress != null &&
        _emailAddress != '' &&
        _password != null &&
        _password != '') {
      _isSignInButtonEnabled = true;
    } else {
      _isSignInButtonEnabled = false;
    }
    setState(() {});
  }

  void _onEmailAddressChange(String text) {
    _emailAddress = text;
    setState(() {});
  }

  void _onPasswordChange(String text) {
    _password = text;
    setState(() {});
  }
}
