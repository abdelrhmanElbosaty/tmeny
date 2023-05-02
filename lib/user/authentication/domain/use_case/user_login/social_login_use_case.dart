import 'package:tmeny_flutter/common/domain/exceptions/exceptions.dart';
import 'package:tmeny_flutter/common/domain/exceptions/status_codes.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/social/social_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';
import 'package:tmeny_flutter/user/authentication/utils/localization/authentication_localizer.dart';

class SocialLoginUseCase {
  final UserAuthenticationRepository _repository;

  SocialLoginUseCase(this._repository);

  Future<void> execute(SocialLoginInput input) async {
    if (input.providerId.isEmpty) {
      throw ApiRequestException(
        StatusCodes.invalidProviderId,
        AuthenticationLocalizer.invalidProviderIdError,
      );
    }
     await _repository.socialLogin(input);
  }

}
