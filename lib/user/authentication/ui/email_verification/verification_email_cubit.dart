import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/handle_otp_use_case.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_code_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/models/email_verification/email_verification_input.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/email_verification/email_user_verification_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/email_verification/resend_verification_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/forget_password_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/forget_password/verify_reset_password_verification_code_use_case.dart';
import 'package:tmeny_flutter/user/authentication/ui/email_verification/verification_email_state.dart';

class VerificationEmailCodeCubit extends Cubit<VerificationEmailCodeState> {
  late final EmailUserVerificationUseCase _emailUserVerificationUseCase;
  late final ResendVerificationUseCase _resendVerificationUseCase;
  late final HandleOTPUseCase _handleOTPUseCase;
  late final ForgetPasswordUseCase _forgotPasswordUseCase;
  late final VerifyForgetPasswordVerificationCode _passwordVerificationCode;

  VerificationEmailCodeCubit()
      : super(const VerificationEmailCodeState.initial()) {
    _loadUseCases();
  }

  void _loadUseCases() {
    _emailUserVerificationUseCase = injector();
    _resendVerificationUseCase = injector();
    _handleOTPUseCase = injector();
    _forgotPasswordUseCase = injector();
    _passwordVerificationCode = injector();
  }

  Future<void> verifyEmailVerificationCode(
      VerificationCodeInput input) async {
    await handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      await collect(task: () async {
        emit(state.reduce(verifyCode: const Async.loading()));
        await _emailUserVerificationUseCase.execute(input);
        emit(state.reduce(verifyCode: const Async.successWithoutData()));
      }, onError: (errorMessage) {
        emit(
          state.reduce(
            verifyCode: Async.failure(errorMessage.toString()),
            errorMessage: errorMessage,
          ),
        );
      });
    }
  }

  Future<void> verifyResetPasswordVerificationCode(VerificationCodeInput input)async {
    await handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      await collect(task: () async {
        emit(state.reduce(verifyCode: const Async.loading()));
        await _emailUserVerificationUseCase.execute(input);
        emit(state.reduce(verifyCode: const Async.successWithoutData()));
      }, onError: (errorMessage) {
        emit(
          state.reduce(
            verifyCode: Async.failure(errorMessage.toString()),
            errorMessage: errorMessage,
          ),
        );
      });
    }
  }

  Future<void> forgotPasswordVerifyEmail(String email) async {
    await handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      emit(state.reduce(verifyEmailState: const Async.initial()));
      await collect(
        task: () async {
          emit(state.reduce(verifyEmailState: const Async.loading()));
          await _forgotPasswordUseCase.execute(email);
          emit(state.reduce(verifyEmailState: const Async.successWithoutData()));
          emit(state.reduce(verifyEmailState: const Async.initial()));
        },
        onError: (errorMessage) {
          emit(state.reduce(
              errorMessage: errorMessage,
              verifyEmailState: Async.failure(errorMessage)));
        },
      );
    }
  }

  Future<void> resendVerificationCode(
      EmailVerificationCodeInput emailVerificationCodeInput) async {
    print('state.otp.data?.isBlocked ${state.otp.data?.isBlocked}');
    await handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      await collect(task: () async {
        emit(state.reduce(resendCode: const Async.loading()));
        await _resendVerificationUseCase.execute(emailVerificationCodeInput);
        emit(state.reduce(resendCode: const Async.successWithoutData()));
        emit(state.reduce(resendCode: const Async.initial()));
      }, onError: (errorMessage) {
        emit(state.reduce(
            errorMessage: errorMessage,
            resendCode: Async.failure(errorMessage)));
      });
    }
  }

  Future<void> verifyForgetPasswordVerificationCode(
      VerificationCodeInput input) async {
    await handleOTP();
    if (!(state.otp.data?.isBlocked ?? false)) {
      await collect(task: () async {
        emit(state.reduce(verifyCode: const Async.loading()));
        await _passwordVerificationCode.execute(input);
        emit(state.reduce(verifyCode: const Async.successWithoutData()));
      }, onError: (errorMessage) {
        emit(
          state.reduce(
            verifyCode: Async.failure(errorMessage.toString()),
            errorMessage: errorMessage,
          ),
        );
      });
    }
  }




  Future<void> handleOTP() async {
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
