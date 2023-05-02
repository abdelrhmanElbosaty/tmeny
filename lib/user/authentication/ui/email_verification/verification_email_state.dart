import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/common/base/async.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';

class VerificationEmailCodeState extends Equatable {
  final Async<bool> verifyCode;
  final Async<void> resendCode;
  final Async<OTP> otp;
  final Async<void> verifyEmailState;
  final String? errorMessage;

  const VerificationEmailCodeState(this.verifyCode, this.errorMessage,
      this.resendCode, this.otp, this.verifyEmailState);

  const VerificationEmailCodeState.initial()
      : this(
          const Async.initial(),
          null,
          const Async.initial(),
          const Async.initial(),
          const Async.initial(),
        );

  VerificationEmailCodeState reduce(
      {Async<bool>? verifyCode,
      String? errorMessage,
      Async<bool>? resendCode,
      Async<OTP>? otp,
      Async<void>? verifyEmailState}) {
    return VerificationEmailCodeState(
        verifyCode ?? this.verifyCode,
        errorMessage,
        resendCode ?? this.resendCode,
        otp ?? this.otp,
        verifyEmailState ?? this.verifyEmailState);
  }

  @override
  List<Object?> get props =>
      [verifyCode, errorMessage, resendCode, otp, verifyEmailState];
}
