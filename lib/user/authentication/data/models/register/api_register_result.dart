// To parse this JSON data, do
//
//     final apiUserRegisterResult = apiUserRegisterResultFromJson(jsonString);

import 'dart:convert';

ApiUserRegisterResult apiUserRegisterResultFromJson(String str) => ApiUserRegisterResult.fromJson(json.decode(str));

String apiUserRegisterResultToJson(ApiUserRegisterResult data) => json.encode(data.toJson());

class ApiUserRegisterResult {
  ApiUserRegisterResult({
    this.registerAsTourist,
  });

  RegisterAsTourist? registerAsTourist;

  factory ApiUserRegisterResult.fromJson(Map<String, dynamic> json) => ApiUserRegisterResult(
    registerAsTourist: json["registerAsTourist"] == null ? null : RegisterAsTourist.fromJson(json["registerAsTourist"]),
  );

  Map<String, dynamic> toJson() => {
    "registerAsTourist": registerAsTourist?.toJson(),
  };
}

class RegisterAsTourist {
  RegisterAsTourist({
    this.message,
    this.data,
    this.code,
    this.success,
  });

  String? message;
  bool? data;
  int? code;
  bool? success;

  factory RegisterAsTourist.fromJson(Map<String, dynamic> json) => RegisterAsTourist(
    message: json["message"],
    data: json["data"],
    code: json["code"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
    "code": code,
    "success": success,
  };
}
