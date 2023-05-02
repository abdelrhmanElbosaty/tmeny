class UserLoginInput {
  final String email;
  final String password;
  String? fcmToken;
  // final LanguageEnum langEnum;
  UserLoginInput({
    required this.password,
    required this.email,
    //required this.langEnum,
  });
}

// enum LanguageEnum { EN, AR }
