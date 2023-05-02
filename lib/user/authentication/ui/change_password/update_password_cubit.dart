import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/update_password/update_password_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/user_update_password_usecase.dart';
import 'package:tmeny_flutter/user/authentication/ui/change_password/update_password_state.dart';

class UserUpdatePasswordCubit extends Cubit<UserUpdatePasswordState> {
  UserUpdatePasswordCubit() : super(const UserUpdatePasswordState.initial()) {
    _loadUseCase();
  }

  late final UserUpdatePasswordUseCase _updatePasswordUseCase;

  void _loadUseCase() {
    _updatePasswordUseCase = injector();
  }

  Future<void> updatePassword(UserUpdatePasswordInput input) async {
    await collect(task: () async {
      emit(state.reduce(updatePasswordState: const Async.loading()));
      await _updatePasswordUseCase.execute(input);
      emit(state.reduce(updatePasswordState: const Async.successWithoutData()));
    }, onError: (errorMessage) {
      emit(
        state.reduce(
          updatePasswordState: Async.failure(errorMessage.toString()),
          errorMessage: errorMessage,
        ),
      );
    });
  }
}
