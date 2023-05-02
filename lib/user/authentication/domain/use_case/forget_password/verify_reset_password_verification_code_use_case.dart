
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class VerifyForgetPasswordVerificationCode{

  final UserAuthenticationRepository _authenticationRepository;

  VerifyForgetPasswordVerificationCode(this._authenticationRepository);

  Future<bool> execute(VerificationCodeInput input) async {
    return await _authenticationRepository.verifyForgetPasswordVerificationCode(input);
  }
}