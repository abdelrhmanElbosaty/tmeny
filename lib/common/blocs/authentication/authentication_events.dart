import 'package:equatable/equatable.dart';

/// Events are:
/// 1- AppStarted
/// 2- Authenticated
/// 3- LoggedOut
/// 4- WalkthroughDone
/// 5- AuthRestart

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthenticationEvent {}

class OnFinishWalkThrowEvent extends AuthenticationEvent {}

class AuthenticatedEvent extends AuthenticationEvent {}

class GuestEvent extends AuthenticationEvent {}

class LoggedOutEvent extends AuthenticationEvent {}

class AuthRestartEvent extends AuthenticationEvent {}
