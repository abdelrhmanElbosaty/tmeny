import 'package:equatable/equatable.dart';

class VerificationCodeInput extends Equatable {
  final String email;
  final String verificationCode;

  const VerificationCodeInput({required this.email,required this.verificationCode});

  @override
  List<Object?> get props => [email, verificationCode];
}
