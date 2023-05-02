// To parse this JSON data, do
//
//     final apiUserLoginResult = apiUserLoginResultFromJson(jsonString);

import 'dart:convert';

ApiUserLoginResult apiUserLoginResultFromJson(String str) => ApiUserLoginResult.fromJson(json.decode(str));

String apiUserLoginResultToJson(ApiUserLoginResult data) => json.encode(data.toJson());

class ApiUserLoginResult {
  ApiUserLoginResult({
    this.emailAndPasswordLogin,
  });

  EmailAndPasswordLogin? emailAndPasswordLogin;

  factory ApiUserLoginResult.fromJson(Map<String, dynamic> json) => ApiUserLoginResult(
    emailAndPasswordLogin: json["emailAndPasswordLogin"] == null ? null : EmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
  );

  Map<String, dynamic> toJson() => {
    "emailAndPasswordLogin": emailAndPasswordLogin?.toJson(),
  };
}

class EmailAndPasswordLogin {
  EmailAndPasswordLogin({
    this.message,
    this.data,
    this.code,
    this.success,
  });

  String? message;
  EmailAndPasswordLoginData? data;
  int? code;
  bool? success;

  factory EmailAndPasswordLogin.fromJson(Map<String, dynamic> json) => EmailAndPasswordLogin(
    message: json["message"],
    data: json["data"] == null ? null : EmailAndPasswordLoginData.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "code": code,
    "success": success,
  };
}

class EmailAndPasswordLoginData {
  EmailAndPasswordLoginData({
    this.id,
    this.email,
    this.token,
    this.isCompletedRegister,
  });

  String? id;
  String? email;
  String? token;
  bool? isCompletedRegister;

  factory EmailAndPasswordLoginData.fromJson(Map<String, dynamic> json) => EmailAndPasswordLoginData(
    id: json["id"],
    email: json["email"],
    token: json["token"],
    isCompletedRegister: json["isCompletedRegister"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "token": token,
    "isCompletedRegister": isCompletedRegister,
  };
}
