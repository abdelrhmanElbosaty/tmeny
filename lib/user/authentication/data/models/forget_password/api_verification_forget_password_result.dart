// To parse this JSON data, do
//
//     final apiForgetPasswordVerificationResult = apiForgetPasswordVerificationResultFromJson(jsonString);

import 'dart:convert';

ApiForgetPasswordVerificationResult apiForgetPasswordVerificationResultFromJson(String str) => ApiForgetPasswordVerificationResult.fromJson(json.decode(str));

String apiForgetPasswordVerificationResultToJson(ApiForgetPasswordVerificationResult data) => json.encode(data.toJson());

class ApiForgetPasswordVerificationResult {
  ApiForgetPasswordVerificationResult({
    this.verifyForgetPasswordCode,
  });

  VerifyForgetPasswordCode? verifyForgetPasswordCode;

  factory ApiForgetPasswordVerificationResult.fromJson(Map<String, dynamic> json) => ApiForgetPasswordVerificationResult(
    verifyForgetPasswordCode: json["verifyForgetPasswordCode"] == null ? null : VerifyForgetPasswordCode.fromJson(json["verifyForgetPasswordCode"]),
  );

  Map<String, dynamic> toJson() => {
    "verifyForgetPasswordCode": verifyForgetPasswordCode?.toJson(),
  };
}

class VerifyForgetPasswordCode {
  VerifyForgetPasswordCode({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  bool? data;
  int? code;
  bool? success;
  String? message;

  factory VerifyForgetPasswordCode.fromJson(Map<String, dynamic> json) => VerifyForgetPasswordCode(
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
