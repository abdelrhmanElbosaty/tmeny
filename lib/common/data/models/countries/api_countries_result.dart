import 'dart:convert';

ApiCountriesResult apiCountriesResultFromJson(String str) =>
    ApiCountriesResult.fromJson(json.decode(str));

String apiCountriesResultToJson(ApiCountriesResult data) =>
    json.encode(data.toJson());

class ApiCountriesResult {
  ApiCountriesResult({
    this.nationalities,
  });

  ApiNationalities? nationalities;

  factory ApiCountriesResult.fromJson(Map<String, dynamic> json) =>
      ApiCountriesResult(
        nationalities: ApiNationalities.fromJson(json["nationalities"]),
      );

  Map<String, dynamic> toJson() => {
        "nationalities": nationalities?.toJson(),
      };
}

class ApiNationalities {
  ApiNationalities({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  List<ApiNationalitiesData>? data;
  int? code;
  bool? success;
  String? message;

  factory ApiNationalities.fromJson(Map<String, dynamic> json) =>
      ApiNationalities(
        data: List<ApiNationalitiesData>.from(
            json["data"].map((x) => ApiNationalitiesData.fromJson(x))),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
        "code": code,
        "success": success,
        "message": message,
      };
}

class ApiNationalitiesData {
  ApiNationalitiesData({
    this.id,
    this.arName,
    this.enName,
    this.isoCode,
    this.flagPng,
  });

  String? id;
  String? arName;
  String? enName;
  String? isoCode;
  String? flagPng;

  factory ApiNationalitiesData.fromJson(Map<String, dynamic> json) =>
      ApiNationalitiesData(
        id: json["id"],
        arName: json["arName"],
        enName: json["enName"],
        isoCode: json["isoCode"],
        flagPng: json["flag_png"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arName": arName,
        "enName": enName,
        "isoCode": isoCode,
        "flag_png": flagPng,
      };
}
