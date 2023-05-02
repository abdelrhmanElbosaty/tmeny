
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

typedef ValidationPredicate = String? Function(Validation validatable);

class Validation {

  static const emailRegex =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  static const specialCharacters = "!@#\$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢";
  static const capitalCharacterRegex = "[A-Z]";
  static const passwordRegex =
      '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,25}';
  static const nameRegex = '^[a-zA-Z\u0621-\u064A ]+\$';

  final String _text;

  Validation(String? text) : _text = text ?? '';

  String? validateAgainst(List<ValidationPredicate> validations) {
    final errors = validations
        .map((e) => e(this))
        .where((element) => element != null && element.isNotEmpty);
    if (errors.isEmpty) {
      return null;
    } else {
      return errors.join(',\n');
    }
  }

  String hasValidUrl(String value) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter url';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid url';
    }
    return '';
  }

  String? emailValidation() {
    isEmptyEmail();
    if (isEmailInValidType()) {
      return AuthenticationLocalizer.errorEmail;
    } else if (isEmailHaveCapitalCharacters()) {
      return AuthenticationLocalizer.errorEmailCapitalCharacters;
    }else if(_text.contains(' ')){
      return AuthenticationLocalizer.emailHasSpace;
    }
    return null;
  }

  String? isEmptyEmail(){
    if(_text.isEmpty){
      return AuthenticationLocalizer.errorEmailEmpty;
    }
    return null;
  }

  bool isEmailInValidType() {
    final isValid = RegExp(emailRegex).hasMatch(_text);
    return !isValid;
  }

  String? passwordValidation() {
    if (_text.isEmpty) {
      return AuthenticationLocalizer.errorPasswordEmpty;
    } else if (isPasswordInValid()) {
      return AuthenticationLocalizer.errorPassword;
    }
    return null;
  }

  bool isPasswordInValid() {
    final isValid = RegExp(passwordRegex).hasMatch(_text);
    return !isValid;
  }

  bool isEmailHaveCapitalCharacters() {
    final x = RegExp(capitalCharacterRegex).hasMatch(_text);
    return x;
  }

  bool isEmail() {
    final x = RegExp(emailRegex).hasMatch(_text);
    return x;
  }

  String? nameValidation() {
    if (_text.isEmpty) {
      return AuthenticationLocalizer.nameIsRequired;
    } else if (isNameInValidType()) {
      return AuthenticationLocalizer.inValidName;
    } else if (_text.length < 2 || _text.length > 25) {
      return AuthenticationLocalizer.nameLengthError;
    }
    return null;
  }

  bool isNameInValidType() {
    final isValid = RegExp(nameRegex).hasMatch(_text);
    return !isValid;
  }

  String? validateButNotRequired(List<ValidationPredicate> validations) {
    if (_text.isEmpty) return AuthenticationLocalizer.errorEmailEmpty;
    return validateAgainst(validations);
  }

  String? validatePasswordButNotRequired(
      List<ValidationPredicate> validations) {
    if (_text.isEmpty) return null;
    return validateAgainst(validations);
  }

  String? validatePhone(List<ValidationPredicate> validations) {
    if (_text.isEmpty) {
      return AuthenticationLocalizer.pleaseEnterYourPhone;
    }
    return null;
    // return validateAgainst(validations);
  }

  String? noValidate() {
    return null;
  }

  bool isNumeric() {
    final x = double.tryParse(_text);
    return x != null;
  }

  bool isEmailOrPhone() {
    return isEmail() || isNumeric();
  }

  bool isGreaterThanOrEqual(int minLength) {
    return _text.length >= minLength;
  }

  bool isEqualTo(int length) {
    return _text.length == length;
  }

  bool isLessThanOrEqual(int maxLength) {
    return _text.length <= maxLength;
  }

  bool isTheSameAs(String text) {
    return text == _text;
  }

  bool hasSpecialCharacters() {
    return hasAnyCharacterIn(specialCharacters);
  }

  bool hasAnyCharacterIn(String pattern) {
    for (int i = 0; i < _text.length; i++) {
      for (int j = 0; j < pattern.length; j++) {
        if (_text[i] == pattern[j]) return true;
      }
    }
    return false;
  }
}
