import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/base/async.dart';

class SocialLoginState extends Equatable {
  final Async<void> socialLogin;
  final String? errorMessage;

  const SocialLoginState(
      this.socialLogin,
      this.errorMessage,
      );

  const SocialLoginState.initial() : this(
    const Async.initial(),
    null,
  );

  SocialLoginState reduce({
    Async<void>? socialLogin,
    String? errorMessage,
  }) {
    return SocialLoginState(
      socialLogin ?? this.socialLogin,
      errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    socialLogin,
    errorMessage,
  ];
}
