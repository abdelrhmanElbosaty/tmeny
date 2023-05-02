import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class UserLoginUseCase {
  final UserAuthenticationRepository _repository;
  UserLoginUseCase(this._repository);

  Future<CachedUserData> execute(UserLoginInput loginInput) async {
    final result = await _repository.userLogin(loginInput);
    return result;
  }
}
