// To parse this JSON data, do
//
//     final uploadFileResult = uploadFileResultFromJson(jsonString);

import 'dart:convert';

UploadFileResult uploadFileResultFromJson(String str) => UploadFileResult.fromJson(json.decode(str));

String uploadFileResultToJson(UploadFileResult data) => json.encode(data.toJson());

class UploadFileResult {
  UploadFileResult({
    this.uploadFile,
  });

  UploadFile? uploadFile;

  factory UploadFileResult.fromJson(Map<String, dynamic> json) => UploadFileResult(
    uploadFile: json["uploadFile"] == null ? null : UploadFile.fromJson(json["uploadFile"]),
  );

  Map<String, dynamic> toJson() => {
    "uploadFile": uploadFile?.toJson(),
  };
}

class UploadFile {
  UploadFile({
    this.data,
    this.message,
    this.code,
    this.success,
  });

  String? data;
  String? message;
  int? code;
  bool? success;

  factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
    data: json["data"],
    message: json["message"],
    code: json["code"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
    "success": success,
  };
}
