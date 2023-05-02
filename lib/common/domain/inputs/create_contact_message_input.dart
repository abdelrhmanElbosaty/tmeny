import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/domain/models/contact_reason.dart';

class CreateContactMessageInput extends Equatable {
  final String name;
  final String? email;
  final String phone;
  final ContactReason reason;
  final String message;

  const CreateContactMessageInput(this.name, this.email, this.phone, this.reason, this.message);

  @override
  List<Object?> get props => [name, email, phone, reason, message];
}