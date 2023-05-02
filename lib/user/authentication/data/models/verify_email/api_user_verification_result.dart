// To parse this JSON data, do
//
//     final apiEmailUserRegisterVerificationResult = apiEmailUserRegisterVerificationResultFromJson(jsonString);

import 'dart:convert';

ApiEmailUserRegisterVerificationResult apiEmailUserRegisterVerificationResultFromJson(String str) => ApiEmailUserRegisterVerificationResult.fromJson(json.decode(str));

String apiEmailUserRegisterVerificationResultToJson(ApiEmailUserRegisterVerificationResult data) => json.encode(data.toJson());

class ApiEmailUserRegisterVerificationResult {
  ApiEmailUserRegisterVerificationResult({
    this.verifyTouristByEmail,
  });

  VerifyTouristByEmail? verifyTouristByEmail;

  factory ApiEmailUserRegisterVerificationResult.fromJson(Map<String, dynamic> json) => ApiEmailUserRegisterVerificationResult(
    verifyTouristByEmail: json["verifyTouristByEmail"] == null ? null : VerifyTouristByEmail.fromJson(json["verifyTouristByEmail"]),
  );

  Map<String, dynamic> toJson() => {
    "verifyTouristByEmail": verifyTouristByEmail?.toJson(),
  };
}

class VerifyTouristByEmail {
  VerifyTouristByEmail({
    this.data,
    this.message,
    this.code,
    this.success,
  });

  ApiVerificationUserData? data;
  String? message;
  int? code;
  bool? success;

  factory VerifyTouristByEmail.fromJson(Map<String, dynamic> json) => VerifyTouristByEmail(
    data: json["data"] == null ? null : ApiVerificationUserData.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
    "success": success,
  };
}

class ApiVerificationUserData {
  ApiVerificationUserData({
    this.id,
    this.token,
    this.isCompletedRegister,
  });

  String? id;
  String? token;
  bool? isCompletedRegister;

  factory ApiVerificationUserData.fromJson(Map<String, dynamic> json) => ApiVerificationUserData(
    id: json["id"],
    token: json["token"],
    isCompletedRegister: json["isCompletedRegister"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "isCompletedRegister": isCompletedRegister,
  };
}
