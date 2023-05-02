// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:tmeny_flutter/common/domain/inputs/create_contact_message_input.dart';
import 'package:tmeny_flutter/common/domain/models/contact_reason.dart';
 part 'api_create_contact_message_input.g.dart';

@JsonSerializable()
class ApiCreateContactMessageInput {
  final String name;
  final String? email;
  final String phone;
  final ContactReasonEnum contactReason;
  final String message;

  factory ApiCreateContactMessageInput.fromJson(Map<String, dynamic> json) =>
      _$ApiCreateContactMessageInputFromJson(json);

  factory ApiCreateContactMessageInput.fromInput(
      CreateContactMessageInput input) {
    return ApiCreateContactMessageInput(
      input.name,
      input.email,
      input.phone,
      input.reason.map(),
      input.message,
    );
  }

  ApiCreateContactMessageInput(
    this.name,
    this.email,
    this.phone,
    this.contactReason,
    this.message,
  );

  Map<String, dynamic> toJson() => _$ApiCreateContactMessageInputToJson(this);
}

enum ContactReasonEnum {
  BUYER_COMPLAINT,
  STORE_COMPLAINT,
  PRODUCT_COMPLAINT,
  OTHER,
  COMPLAINT,
  TECHNICAL_ISSUE,
  SUGGESTION,
  FOR_BUSINESS,
  REFUND
}

extension on ContactReason {
  ContactReasonEnum map() {
    switch (this) {
      case ContactReason.buyerComplaint:
        return ContactReasonEnum.BUYER_COMPLAINT;
      case ContactReason.storeComplaint:
        return ContactReasonEnum.STORE_COMPLAINT;
      case ContactReason.productComplaint:
        return ContactReasonEnum.PRODUCT_COMPLAINT;
      case ContactReason.other:
        return ContactReasonEnum.OTHER;

      case ContactReason.complaint:
        return ContactReasonEnum.COMPLAINT;
      case ContactReason.technicalIssue:
        return ContactReasonEnum.TECHNICAL_ISSUE;
      case ContactReason.suggestion:
        return ContactReasonEnum.SUGGESTION;
      case ContactReason.forBusiness:
        return ContactReasonEnum.FOR_BUSINESS;
      case ContactReason.refund:
        return ContactReasonEnum.REFUND;
    }
  }
}
