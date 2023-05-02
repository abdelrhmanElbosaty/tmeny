// To parse this JSON data, do
//
//     final privacyPolicyResult = privacyPolicyResultFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyResult privacyPolicyResultFromJson(String str) => PrivacyPolicyResult.fromJson(json.decode(str));

String privacyPolicyResultToJson(PrivacyPolicyResult data) => json.encode(data.toJson());

class PrivacyPolicyResult {
  PrivacyPolicyResult({
    this.appConfiguration,
  });

  AppConfiguration? appConfiguration;

  factory PrivacyPolicyResult.fromJson(Map<String, dynamic> json) => PrivacyPolicyResult(
    appConfiguration: json["appConfiguration"] == null ? null : AppConfiguration.fromJson(json["appConfiguration"]),
  );

  Map<String, dynamic> toJson() => {
    "appConfiguration": appConfiguration?.toJson(),
  };
}

class AppConfiguration {
  AppConfiguration({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  AppConfigurationData? data;
  int? code;
  bool? success;
  String? message;

  factory AppConfiguration.fromJson(Map<String, dynamic> json) => AppConfiguration(
    data: json["data"] == null ? null : AppConfigurationData.fromJson(json["data"]),
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

class AppConfigurationData {
  AppConfigurationData({
    this.id,
    this.key,
    this.value,
    this.displayAs,
  });

  String? id;
  String? key;
  String? value;
  String? displayAs;

  factory AppConfigurationData.fromJson(Map<String, dynamic> json) => AppConfigurationData(
    id: json["id"],
    key: json["key"],
    value: json["value"],
    displayAs: json["displayAs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
    "displayAs": displayAs,
  };
}
