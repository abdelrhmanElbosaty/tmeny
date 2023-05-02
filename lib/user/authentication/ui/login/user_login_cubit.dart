import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/common/utils/common.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_login_input/user_login_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/user_login_usecase.dart';
import 'package:tmeny_flutter/user/authentication/ui/login/user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  late UserLoginUseCase _userLoginUseCase;

  UserLoginCubit() : super(const UserLoginState.initial()) {
    _loadUseCases();
  }

  void _loadUseCases() {
    _userLoginUseCase = injector();
  }

  Future<void> userLogin(UserLoginInput input) async {
    await collect(task: () async {
      emit(state.reduce(loginState: const Async.loading()));
      final userData = await _userLoginUseCase.execute(input);
      emit(state.reduce(loginState: Async.success(userData)));
    }, onError: (errorMessage) {
      emit(state.reduce(
          errorMessage: errorMessage, loginState: Async.failure(errorMessage)));
    }, catchError: (e) {
      logDebug(e);
    });
  }
}
