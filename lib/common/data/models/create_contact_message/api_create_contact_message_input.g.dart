// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_create_contact_message_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCreateContactMessageInput _$ApiCreateContactMessageInputFromJson(
        Map<String, dynamic> json) =>
    ApiCreateContactMessageInput(
      json['name'] as String,
      json['email'] as String?,
      json['phone'] as String,
      $enumDecode(_$ContactReasonEnumEnumMap, json['contactReason']),
      json['message'] as String,
    );

Map<String, dynamic> _$ApiCreateContactMessageInputToJson(
        ApiCreateContactMessageInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'contactReason': _$ContactReasonEnumEnumMap[instance.contactReason]!,
      'message': instance.message,
    };

const _$ContactReasonEnumEnumMap = {
  ContactReasonEnum.BUYER_COMPLAINT: 'BUYER_COMPLAINT',
  ContactReasonEnum.STORE_COMPLAINT: 'STORE_COMPLAINT',
  ContactReasonEnum.PRODUCT_COMPLAINT: 'PRODUCT_COMPLAINT',
  ContactReasonEnum.OTHER: 'OTHER',
  ContactReasonEnum.COMPLAINT: 'COMPLAINT',
  ContactReasonEnum.TECHNICAL_ISSUE: 'TECHNICAL_ISSUE',
  ContactReasonEnum.SUGGESTION: 'SUGGESTION',
  ContactReasonEnum.FOR_BUSINESS: 'FOR_BUSINESS',
  ContactReasonEnum.REFUND: 'REFUND',
};
