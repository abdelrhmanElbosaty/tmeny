// To parse this JSON data, do
//
//     final apiUpdatePasswordResult = apiUpdatePasswordResultFromJson(jsonString);

import 'dart:convert';

ApiUpdatePasswordResult apiUpdatePasswordResultFromJson(String str) => ApiUpdatePasswordResult.fromJson(json.decode(str));

String apiUpdatePasswordResultToJson(ApiUpdatePasswordResult data) => json.encode(data.toJson());

class ApiUpdatePasswordResult {
  ApiUpdatePasswordResult({
    this.resetPassword,
  });

  ResetPassword? resetPassword;

  factory ApiUpdatePasswordResult.fromJson(Map<String, dynamic> json) => ApiUpdatePasswordResult(
    resetPassword: json["resetPassword"] == null ? null : ResetPassword.fromJson(json["resetPassword"]),
  );

  Map<String, dynamic> toJson() => {
    "resetPassword": resetPassword?.toJson(),
  };
}

class ResetPassword {
  ResetPassword({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.token,
    this.firstName,
    this.lastName,
    this.fullName,
    this.isCompletedRegister,
  });

  String? id;
  dynamic token;
  String? firstName;
  String? lastName;
  String? fullName;
  bool? isCompletedRegister;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    token: json["token"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    isCompletedRegister: json["isCompletedRegister"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "isCompletedRegister": isCompletedRegister,
  };
}
