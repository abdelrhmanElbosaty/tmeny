

import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class EmailUserVerificationUseCase {
  final UserAuthenticationRepository _repository;

  EmailUserVerificationUseCase(
    this._repository,
  );

  Future<CachedUserData> execute(VerificationCodeInput input) async {
    final data = await _repository.registerVerification(input);
    return data;
  }
}
