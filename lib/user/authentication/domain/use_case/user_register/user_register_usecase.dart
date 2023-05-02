import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/repositories/user_authentication_repository.dart';

class UserRegisterUseCase {
  UserRegisterUseCase(this._userAuthenticationRepository);

  final UserAuthenticationRepository _userAuthenticationRepository;

  Future<bool> execute(UserRegisterInput input) async {
    return await _userAuthenticationRepository.userRegister(input);
  }
}
