import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tmeny_flutter/common/utils/common.dart';

class FcmTokenUseCase {
  Future<String> execute() async {
    try {
      if (Platform.isIOS) {
        final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        logDebug("APNS Token: $apnsToken");
      }
      final token = await FirebaseMessaging.instance.getToken();
      logDebug("FCM Token: $token}");
      return token ?? "";
    } catch (e) {
      logDebug(e);
      throw RetrieveFcmTokenFailureException();
    }
  }
}

class RetrieveFcmTokenFailureException implements Exception {}
