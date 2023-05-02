import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';

class RegisterState extends Equatable {
  final Async<bool> registerState;
  final Async<OTP> otp;
  final String? errorMessage;

  const RegisterState(
    this.registerState,
    this.otp,
    this.errorMessage,
  );

  const RegisterState.initial()
      : this(
          const Async.initial(),
          const Async.initial(),
          null,
        );

  RegisterState reduce({
    Async<bool>? registerState,
    Async<OTP>? otp,
    String? errorMessage,
  }) {
    return RegisterState(
      registerState ?? this.registerState,
      otp ?? this.otp,
      errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        registerState,
        otp,
        errorMessage,
      ];
}
