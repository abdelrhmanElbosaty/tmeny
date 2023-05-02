import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/app_text_field_tile.dart';
import 'package:tmeny_flutter/common/utils/app_material/text_fields/format/upper_case_text_formatter.dart';
import 'package:tmeny_flutter/common/utils/validation/validation_rules.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _emailAddress;

  @override
  Widget build(BuildContext context) {
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
            validator: (email) => _emailValidator(email),
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
}
