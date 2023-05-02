
import 'package:tmeny_flutter/common/domain/models/otp.dart';

abstract class ShardPreferencesHelper {
  Future<bool> setLanguage(String language);

  Future<String?> getLanguage();

  Future<bool> setOTP(OTP otp);

  Future<void> deleteOTP();

  Future<OTP?> getOTP();

}
