import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmeny_flutter/common/domain/models/otp.dart';
import 'package:tmeny_flutter/di/app_injector.dart';

import 'shared_preferences_helper.dart';


class SharedPreferencesHelperImp implements ShardPreferencesHelper {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> _getInstance() async {
    return _sharedPreferences ??= await injector.getAsync();
  }

  @override
  Future<String?> getLanguage() async {
    final instant = await _getInstance();
    return instant.getString(_PreferencesKeys.languageKey);
  }

  @override
  Future<bool> setLanguage(String language) async {
    final instant = await _getInstance();
    return await instant.setString(_PreferencesKeys.languageKey, language);
  }

  @override
  Future<void> deleteOTP() async {
    final instant = await _getInstance();
    await instant.remove(_PreferencesKeys.otp);
  }

  @override
  Future<OTP?> getOTP() async {
    final instant = await _getInstance();
    final otp = instant.getString(_PreferencesKeys.otp);
    if (otp == null) {
      return null;
    }
    final Map<String, dynamic> decode = json.decode(otp);
    return OTP(
      decode['numberOTPInHour'],
        DateTime.parse(decode['firstOTPTime']),
      decode['isBlocked'],
    );
  }

  @override
  Future<bool> setOTP(OTP otp) async {
    try {
      final instant = await _getInstance();
      Map<String, dynamic> otpObject = {
        'numberOTPInHour': otp.numberOTPInHour,
        'firstOTPTime': otp.firstOTPTime.toString(),
        'isBlocked': otp.isBlocked,
      };
      String encodedMap = json.encode(otpObject);
      return await instant.setString(_PreferencesKeys.otp, encodedMap);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class _PreferencesKeys {
  _PreferencesKeys._();

  static const languageKey = "languageKey";
  static const otp = "otp";
}
