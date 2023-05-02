import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/cached_user_data_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/is_user_authenticated_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/authentication/logout_use_case.dart';
import 'package:tmeny_flutter/common/utils/bloc_utils.dart';
import 'package:tmeny_flutter/common/utils/common.dart';
import 'package:tmeny_flutter/di/app_injector.dart';
import 'authentication_states.dart';
import 'authentication_events.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthState> {
  static AuthenticationBloc of(BuildContext context) {
    return BlocProvider.of(context);
  }

  late final CommonCachedUserDataUseCase _cachedUserUseCase;
  late final IsAuthenticatedUseCase _isUserAuthenticatedUseCase;
  late final CommonLogoutUseCase _commonLogoutUseCase;

  AuthenticationBloc() : super(AuthUninitialized()) {
    _loadUseCases();
    on<AppStartedEvent>(_onAppStarted);
    on<AuthenticatedEvent>(_onAuthenticated);
    on<OnFinishWalkThrowEvent>(_onFinishWalkThrow);
    on<GuestEvent>(_onContinueAsGuest);
    on<AuthRestartEvent>(_onAuthRestart);
    on<LoggedOutEvent>(_onLogout);
  }

  void _loadUseCases() {
    _cachedUserUseCase = injector();
    _isUserAuthenticatedUseCase = injector();
    _commonLogoutUseCase = injector();
  }

  void _onAppStarted(
    AppStartedEvent event,
    Emitter<AuthState> emit,
  ) async {
    logDebug('Auth Started');
    await startMainApp(emit);
  }

  void _onFinishWalkThrow(
    OnFinishWalkThrowEvent event,
    Emitter<AuthState> emit,
  ) async {
    logDebug('Auth LogInPage');
    emit(AuthLogInPage());
  }

  void _onContinueAsGuest(
    GuestEvent event,
    Emitter<AuthState> emit,
  ) async {
    logDebug('GuestState');
    emit(GuestState());
  }

  void _onAuthenticated(
    AuthenticatedEvent event,
    Emitter<AuthState> emit,
  ) async {
    // unsubscribeToGuestTopic();
    await authenticated(emit);
  }

  void _onAuthRestart(
    AuthRestartEvent event,
    Emitter<AuthState> emit,
  ) async {
    logDebug('Auth Restarted');
    emit(AuthUninitialized());
    await startMainApp(emit);
  }

  void _onLogout(
    LoggedOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await collect(task: () async {
      emit(AuthLoading());
      await _commonLogoutUseCase.execute();
      await resetScopeDependencies();
      logDebug('Auth Logged out');
      emit(LogOutState());
    }, onError: (errorMessage) {
      logDebug('Auth Failure');
      emit(AuthFailure(errorMessage));
    },);
  }

  Future<void> authenticated(Emitter<AuthState> emit) async {
    logDebug('Auth Authenticated');
    final user = await _cachedUserUseCase.execute();
    emit(AuthAuthenticated(user));
  }

  Future<void> startMainApp(Emitter<AuthState> emit) async {
    final isAuthenticated = await isUserAuthenticated();
    //isLoggedIn
    if (isAuthenticated) {
      await authenticated(emit);
    } else {
      logDebug('Auth un Authenticated');
      emit(AuthUnauthenticated());
    }
  }

  Future<bool> isUserAuthenticated() async {
    final result = await _isUserAuthenticatedUseCase.execute();
    return result;
  }
}
