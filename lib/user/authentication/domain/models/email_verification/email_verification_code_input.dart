import 'package:equatable/equatable.dart';

class EmailVerificationCodeInput extends Equatable {
  final String email;
  final VerificationUsage verificationUsage;

  const EmailVerificationCodeInput({required this.email,required this.verificationUsage});

  @override
  List<Object?> get props => [email, verificationUsage];
}

enum VerificationUsage {
  passwordReset,
  emailVerification,
}
