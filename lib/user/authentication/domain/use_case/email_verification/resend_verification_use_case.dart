
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class ResendVerificationUseCase {
  final UserAuthenticationRepository _repository;

  ResendVerificationUseCase(
    this._repository,
  );

  Future<bool> execute(EmailVerificationCodeInput input) async {
    final result = await _repository.resendEmailVerificationCode(input);
    return result;
  }
}
