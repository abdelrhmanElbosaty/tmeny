// To parse this JSON data, do
//
//     final apiForgetPasswordResult = apiForgetPasswordResultFromJson(jsonString);

import 'dart:convert';

ApiForgetPasswordResult apiForgetPasswordResultFromJson(String str) => ApiForgetPasswordResult.fromJson(json.decode(str));

String apiForgetPasswordResultToJson(ApiForgetPasswordResult data) => json.encode(data.toJson());

class ApiForgetPasswordResult {
  ApiForgetPasswordResult({
    this.forgetPassword,
  });

  ForgetPassword? forgetPassword;

  factory ApiForgetPasswordResult.fromJson(Map<String, dynamic> json) => ApiForgetPasswordResult(
    forgetPassword: json["forgetPassword"] == null ? null : ForgetPassword.fromJson(json["forgetPassword"]),
  );

  Map<String, dynamic> toJson() => {
    "forgetPassword": forgetPassword?.toJson(),
  };
}

class ForgetPassword {
  ForgetPassword({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  bool? data;
  int? code;
  bool? success;
  String? message;

  factory ForgetPassword.fromJson(Map<String, dynamic> json) => ForgetPassword(
    data: json["data"],
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "code": code,
    "success": success,
    "message": message,
  };
}
