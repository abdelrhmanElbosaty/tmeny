// To parse this JSON data, do
//
//     final createContactMessageResult = createContactMessageResultFromJson(jsonString);

import 'dart:convert';

CreateContactMessageResult createContactMessageResultFromJson(String str) => CreateContactMessageResult.fromJson(json.decode(str));

String createContactMessageResultToJson(CreateContactMessageResult data) => json.encode(data.toJson());

class CreateContactMessageResult {
  CreateContactMessageResult({
    this.createContactMessage,
  });

  CreateContactMessage? createContactMessage;

  factory CreateContactMessageResult.fromJson(Map<String, dynamic> json) => CreateContactMessageResult(
    createContactMessage: json["createContactMessage"] == null ? null : CreateContactMessage.fromJson(json["createContactMessage"]),
  );

  Map<String, dynamic> toJson() => {
    "createContactMessage": createContactMessage?.toJson(),
  };
}

class CreateContactMessage {
  CreateContactMessage({
    this.code,
    this.success,
    this.message,
  });

  int? code;
  bool? success;
  String? message;

  factory CreateContactMessage.fromJson(Map<String, dynamic> json) => CreateContactMessage(
    code: json["code"],
    success: json["success"]  ,
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
  };
}
