import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/data/preferences/models/cached_user_data.dart';

class UserLoginState extends Equatable {
  final Async<CachedUserData> loginState;
  final String? errorMessage;

  const UserLoginState(this.loginState, this.errorMessage);

  const UserLoginState.initial()
      : this(
          const Async.initial(),
          null,
        );

  UserLoginState reduce({
    Async<CachedUserData>? loginState,
    String? errorMessage,
  }) {
    return UserLoginState(
      loginState ?? this.loginState,
      errorMessage ?? errorMessage,
    );
  }

  @override
  List<Object?> get props => [loginState, errorMessage];
}
