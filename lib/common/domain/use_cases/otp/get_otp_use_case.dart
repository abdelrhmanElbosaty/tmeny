

import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/domain/repositories/otp_repository.dart';

class GetOTPUseCase{
  final OTPRepository _otpRepository;

  GetOTPUseCase(this._otpRepository);

  Future<OTP?> execute()async{
    return await _otpRepository.getOTP();
  }
}