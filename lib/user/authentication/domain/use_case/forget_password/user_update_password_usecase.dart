import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class UserUpdatePasswordUseCase{
  final UserAuthenticationRepository _authenticationRepository;

  UserUpdatePasswordUseCase(this._authenticationRepository);

  Future<CachedUserData> execute(UserUpdatePasswordInput input) async{
    final data = await _authenticationRepository.updatePassword(input);
    return data;
  }
}