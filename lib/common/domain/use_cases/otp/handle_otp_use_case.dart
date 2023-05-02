
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/delete_otp_use_case.dart';
import 'package:tmeny_flutter/common/domain/use_cases/otp/get_otp_use_case.dart';

import 'set_opt_use_case.dart';

const int blocOtpDurationInMinutes = 60;
const int _timesToBlocOtp = 20;

class HandleOTPUseCase {
  final SetOTPUseCase _setOTPUseCase;
  final GetOTPUseCase _getOTPUseCase;
  final DeleteOTPUseCase _deleteOTPUseCase;

  HandleOTPUseCase(
    this._setOTPUseCase,
    this._getOTPUseCase,
    this._deleteOTPUseCase,
  );

  Future<OTP> execute() async {
    final otp = await _getOTPUseCase.execute();
    final time = DateTime.now();
    if (otp == null) {
      return await _setOTPFirstTime(time);
    } else {
      if (time.difference(otp.firstOTPTime).inMinutes >=
          blocOtpDurationInMinutes) {
        await _deleteOTPUseCase.execute();
        return await _setOTPFirstTime(time);
      }
      return await _handleOTP(otp);
    }
  }

  Future<OTP> _setOTPFirstTime(DateTime time) async {
    await _setOTPUseCase.execute(OTP(1, time, false));
    return OTP(1, time, false);
  }

  Future<OTP> _handleOTP(OTP otp) async {
    final time = DateTime.now();
    if (otp.numberOTPInHour > _timesToBlocOtp &&
        time.difference(otp.firstOTPTime).inMinutes < blocOtpDurationInMinutes) {
      await _setOTPUseCase
          .execute(OTP(otp.numberOTPInHour, otp.firstOTPTime, true));
      return OTP(otp.numberOTPInHour, otp.firstOTPTime, true);
    } else if (otp.numberOTPInHour <
            _timesToBlocOtp &&
        time.difference(otp.firstOTPTime).inMinutes < blocOtpDurationInMinutes) {
      await _setOTPUseCase
          .execute(OTP(otp.numberOTPInHour + 1, otp.firstOTPTime, false));
      return OTP(otp.numberOTPInHour + 1, otp.firstOTPTime, false);
    }
    await _setOTPUseCase
        .execute(OTP(otp.numberOTPInHour, otp.firstOTPTime, true));
    return OTP(otp.numberOTPInHour, otp.firstOTPTime, true);
  }
}
