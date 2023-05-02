import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/base/async.dart';

class UserUpdatePasswordState extends Equatable {
  final Async<void> updatePasswordState;
  final String? errorMessage;

  const UserUpdatePasswordState(this.updatePasswordState, this.errorMessage);

  const UserUpdatePasswordState.initial() : this(const Async.initial(), null);

  UserUpdatePasswordState reduce(
      {Async<void>? updatePasswordState, String? errorMessage}) {
    return UserUpdatePasswordState(
        updatePasswordState ?? this.updatePasswordState, errorMessage);
  }

  @override
  List<Object?> get props => [updatePasswordState, errorMessage];
}
