import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/handle_otp_use_case.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/inputs/user_register_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_register/user_register_usecase.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late final UserRegisterUseCase _userRegisterUseCase;
  late final HandleOTPUseCase _handleOTPUseCase;

  RegisterCubit() : super(const RegisterState.initial()) {
    _loadUseCases();
  }

  void _loadUseCases() {
    _userRegisterUseCase = injector();
    _handleOTPUseCase = injector();
  }

  Future<void> userRegister(UserRegisterInput input) async {
    await _handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      await collect(task: () async {
        emit(state.reduce(registerState: const Async.loading()));
        await _userRegisterUseCase.execute(input);
        emit(state.reduce(registerState: const Async.successWithoutData()));
        emit(state.reduce(registerState: const Async.initial()));
      }, onError: (errorMessage) {
        emit(state.reduce(
            errorMessage: errorMessage,
            registerState: Async.failure(errorMessage)));
      });
    }
  }

  void initialErrorMessage(){
    emit(state.reduce(errorMessage: null));
  }

  Future<void> _handleOTP() async {
    await collect(
      task: () async {
        emit(state.reduce(otp: const Async.loading()));
        final result = await _handleOTPUseCase.execute();
        emit(state.reduce(otp: Async.success(result)));
      },
      onError: (errorMessage) {
        emit(state.reduce(
          otp: Async.failure(errorMessage),
          errorMessage: errorMessage,
        ));
      },
    );
  }
}
