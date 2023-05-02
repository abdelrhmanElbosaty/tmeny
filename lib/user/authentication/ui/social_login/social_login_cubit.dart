import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/facebook_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/domain/use_case/user_login/google_login_use_case.dart';
import 'package:tmeny_flutter/user/authentication/ui/social_login/social_login_state.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  static SocialLoginCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  late final GoogleLoginUseCase _googleLoginUseCase;
  late final FacebookLoginUseCase _facebookLoginUseCase;

  //late final AppleLoginUseCase _appleLoginUseCase;

  SocialLoginCubit() : super(const SocialLoginState.initial()) {
    _loadUseCase();
  }

  void _loadUseCase() {
    _googleLoginUseCase = injector();
    _facebookLoginUseCase = injector();
  }

  void loginWithFacebook() async {
    emit(state.reduce(socialLogin: const Async.loading()));
    await collect(task: () async {
      final socialInfo = await _facebookLoginUseCase.execute();
      emit(state.reduce(socialLogin: Async.success(socialInfo)));
      emit(state.reduce(socialLogin: const Async.initial()));
    }, onError: (errorMessage) {
      emit(
        state.reduce(
          socialLogin: Async.failure(errorMessage),
          errorMessage: errorMessage,
        ),
      );
    }, catchError: (errorMessage) {
      // emit(state.reduce(
      //   socialLogin: const Async.failure("error"),
      // )); //Todo("Handle Error message here")
    });
  }

  void loginWithGoogle() async {
    await collect(
      task: () async {
        emit(state.reduce(socialLogin: const Async.loading()));
        await _googleLoginUseCase.execute();
        emit(state.reduce(socialLogin: const Async.successWithoutData()));
        emit(state.reduce(socialLogin: const Async.initial()));
      },
      onError: (errorMessage) {
        emit(state.reduce(
          socialLogin: Async.failure(errorMessage),
          errorMessage: errorMessage,
        ));
      },
      catchError: (errorMessage) {
        // emit(state.reduce(
        //   socialLogin: Async.failure(errorMessage),
        //   errorMessage: errorMessage,
        // ));
      },
    );
  }

// void loginWithApple() async {
//   emit(state.reduce(socialLogin: const Async.loading()));
//   await collect(
//       task: () async {
//         final socialInfo=await _appleLoginUseCase.execute();
//         emit(state.reduce(socialLogin: Async.success(socialInfo)));
//         emit(state.reduce(socialLogin: const Async.initial()));
//       },
//       onError: (errorMessage) {
//         emit(state.reduce(
//           errorMessage: errorMessage,
//         ));
//       },
//       catchError: (e) {
//         emit(state.reduce(socialLogin: const Async.failure("error"),));
//       }
//   );
// }
}
