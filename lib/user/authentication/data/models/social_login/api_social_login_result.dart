// To parse this JSON data, do
//
//     final apiSocialLoginOrRegisterResult = apiSocialLoginOrRegisterResultFromJson(jsonString);

import 'dart:convert';

ApiSocialLoginOrRegisterResult apiSocialLoginOrRegisterResultFromJson(String str) => ApiSocialLoginOrRegisterResult.fromJson(json.decode(str));

String apiSocialLoginOrRegisterResultToJson(ApiSocialLoginOrRegisterResult data) => json.encode(data.toJson());

class ApiSocialLoginOrRegisterResult {
  ApiSocialLoginOrRegisterResult({
    this.socialLoginOrRegister,
  });

  SocialLoginOrRegister? socialLoginOrRegister;

  factory ApiSocialLoginOrRegisterResult.fromJson(Map<String, dynamic> json) => ApiSocialLoginOrRegisterResult(
    socialLoginOrRegister: json["socialLoginOrRegister"] == null ? null : SocialLoginOrRegister.fromJson(json["socialLoginOrRegister"]),
  );

  Map<String, dynamic> toJson() => {
    "socialLoginOrRegister": socialLoginOrRegister?.toJson(),
  };
}

class SocialLoginOrRegister {
  SocialLoginOrRegister({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  ApiSocialLoginOrRegisterResultData? data;
  int? code;
  bool? success;
  String? message;

  factory SocialLoginOrRegister.fromJson(Map<String, dynamic> json) => SocialLoginOrRegister(
    data: json["data"] == null ? null : ApiSocialLoginOrRegisterResultData.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "success": success,
    "message": message,
  };
}

class ApiSocialLoginOrRegisterResultData {
  ApiSocialLoginOrRegisterResultData({
    this.id,
    this.token,
    this.isCompletedRegister,
  });

  String? id;
  String? token;
  bool? isCompletedRegister;

  factory ApiSocialLoginOrRegisterResultData.fromJson(Map<String, dynamic> json) => ApiSocialLoginOrRegisterResultData(
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
