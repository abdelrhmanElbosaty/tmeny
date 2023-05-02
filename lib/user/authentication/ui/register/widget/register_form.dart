import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_alerts/otp_blocked_alert.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_buttons/custom_material_buttons.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/format/input_formatters_textformfield.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/format/upper_case_text_formatter.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/phone_field.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';
import 'package:tmeny_flutter/common/utils/app_style/text_styles.dart';
import 'package:tmeny_flutter/common/utils/localization/common_localizer.dart';
import 'package:tmeny_flutter/common/utils/navigation/navigator_functions.dart';
import 'package:tmeny_flutter/common/utils/validation/validation_rules.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/email_code_verification_page.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/register_cubit.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/register_state.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_text_field_tile.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/widget/build_suffix_icon.dart';
import 'package:tmeny_flutter/user/authentication/ui/register/widget/gender_drop_down_menu.dart';
import 'package:tmeny_flutter/user/authentication/ui/widgets/terms_policy_widget.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _emailAddress;
  String? _password;
  final _phoneFieldController = TextEditingController();

  bool _isSignInButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    _checkIfSignUpButtonEnabled();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFieldTile(
                  label: AuthenticationLocalizer.firstName,
                  hintText: AuthenticationLocalizer.firstNameHint,
                  onchange: _onFirstNameChange,
                  maxLength: 25,
                  inputFormatters: [UpperCaseTextFormatter()],
                  validator: (firstName) => _firstNameValidation(firstName),
                ),
              ),
              SizedBox(
                height: Dimensions.large,
                width: Dimensions.large,
              ),
              Expanded(
                child: AppTextFieldTile(
                  label: AuthenticationLocalizer.lastName,
                  hintText: AuthenticationLocalizer.lastNameHint,
                  onchange: _onLastNameChange,
                  maxLength: 25,
                  inputFormatters: [UpperCaseTextFormatter()],
                  validator: (lastName) => _lastNameValidation(lastName),
                ),
              ),
            ],
          ),

          AppTextFieldTile(
            label: AuthenticationLocalizer.email,
            hintText: AuthenticationLocalizer.emailHint,
            onchange: _onEmailAddressChange,
            inputFormatters: [
              FilteringTextInputFormatter.deny(' '),
            ],
            validator: (email) => _emailValidator(email),
          ),
           GenderDropDownMenu(onSelect: (value) {

          },),
          Text("Mobile Number"),
          PhoneField(
            controller: _phoneFieldController,
            hint: "AuthenticationLocalizer.phoneNumber",
            borderColor:
             AppColors.secondary_700 ,
            suffix: BuildSuffixIcon(
              getCountry: (country) {
                // phoneDialCode = ;
                print(country.dialCode);
              },
            ),
            // onchange: (v) {
            //   errorMsg = '' ;
            //   if (v.isEmpty) {
            //     whenTextIsEmpty = true;
            //   }
            //   setState(() {});
            // },
            // validator: (text) {
            //   if (text?.isEmpty ?? false) {
            //     if (whenTextIsEmpty) {
            //       return null;
            //     }
            //     return Validation(text).validatePhone(
            //       [
            //             (string) {
            //           return string.isNumeric()
            //               ? null
            //               : AuthenticationLocalizer.phoneIsNotValid;
            //         },
            //       ],
            //     );
            //   } else {
            //     return null;
            //   }
            // },
          ),
          AppTextFieldTile(
            label: AuthenticationLocalizer.password,
            hintText: AuthenticationLocalizer.passwordHint,
            onchange: _onPasswordChange,
            obscureText: true,
            maxLength: 25,
            validator: (password) => _passwordValidator(password),
          ),
          const TermsAndPolicyWidget(),
          SizedBox(
            height: PaddingDimensions.large,
          ),
          BlocConsumer<RegisterCubit, RegisterState>(
            // listenWhen: (previous, current) =>
            //     previous.registerState != current.registerState,
            listener: (context, state) {
              if (state.otp.data?.isBlocked ?? false) {
                OtpAlerts.blockedOtp(context,
                    otp: state.otp.data ?? OTP(0, DateTime.now(), false));
              } else {
                if (state.registerState.isSuccess) {
                  _navigateToOtpPage();
                }
              }
              // if (state.registerState.isSuccess) {
              //   _navigateToOtpPage();
              // }
            },
            builder: (context, state) {
              return AppMaterialButtons.primaryButton(
                  isLoading: state.registerState.isLoading,
                  text: AuthenticationLocalizer.signUp,
                  onPressed: _isSignInButtonEnabled ? _signUpFun : null);
            },
          ),
        ],
      ),
    );
  }

  String? _firstNameValidation(String? text) =>
      Validation(text).nameValidation();

  String? _lastNameValidation(String? text) =>
      Validation(text).nameValidation();

  String? _emailValidator(String? email) => Validation(email).emailValidation();

  String? _passwordValidator(String? password) =>
      Validation(password).passwordValidation();

  void _onFirstNameChange(String text) {
    _firstName = text;
    setState(() {});
  }


  void _onLastNameChange(String text) {
    _lastName = text;
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

  void _checkIfSignUpButtonEnabled() {
    if (_firstName != null &&
        _firstName != '' &&
        _lastName != null &&
        _lastName != '' &&
        _emailAddress != null &&
        _emailAddress != '' &&
        _password != null &&
        _password != '') {
      _isSignInButtonEnabled = true;
    } else {
      _isSignInButtonEnabled = false;
    }
    setState(() {});
  }

  void _signUpFun() {
    FocusScope.of(context).requestFocus(FocusNode());
    final bool isValidate = _formKey.currentState?.validate() ?? false;
    if (isValidate) {
      final UserRegisterInput input = UserRegisterInput(
          firstName: _firstName!,
          lastName: _lastName!,
          emailAddress: _emailAddress!,
          password: _password!);
      BlocProvider.of<RegisterCubit>(context).userRegister(input);
    } else {
      _initialErrorMessage();
    }
  }

  void _navigateToOtpPage() => pushMaterialPage(
      context,
      EmailCodeVerificationPage(
        title: CommonLocalizer.emailVerification,
        emailVerificationCodeInput: EmailVerificationCodeInput(
            email: _emailAddress ?? '',
            verificationUsage: VerificationUsage.emailVerification),
      ));

  void _initialErrorMessage() =>
      BlocProvider.of<RegisterCubit>(context).initialErrorMessage();
}
