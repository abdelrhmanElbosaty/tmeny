import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';

///States are:
///1- Uninitialized
///2- Authenticated
///3- Unauthenticated
///4- First Time
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

//--------------------------------------
class AuthAuthenticated extends AuthState {
  final CachedUserData user;

  AuthAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFirstTime extends AuthState {}

class AuthUninitialized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLogInPage extends AuthState {}

class GuestState extends AuthState {}

class LogOutState extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}



