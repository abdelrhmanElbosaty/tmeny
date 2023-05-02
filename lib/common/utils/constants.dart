import 'dart:io';
import 'package:flutter/foundation.dart';

class Constants {
  static const isProductionInDebug = false;
  static const isProduction = kReleaseMode ? true : isProductionInDebug;

  static const String endpoint = isProduction
      ? 'http://75.119.134.216:9093/graphql'
      : 'http://75.119.134.216:9093/graphql';

  static const String subscriptionLink = isProduction
      ? 'http://75.119.134.216:9093/graphql'
      : 'http://75.119.134.216:9093/graphql';

  static const String baseUrl = isProduction
      ? 'http://75.119.134.216:9093/graphql'
      : 'http://75.119.134.216:9093/graphql';

  static const String websiteUrl =
      isProduction ? 'https://staging-api.tatmeen.sa/graphql' : 'https://staging-api.tatmeen.sa/graphql';

  static const String adsUrl = 'https://staging-api.tatmeen.sa/graphql';
  static const String storeUrl = 'https://staging-api.tatmeen.sa/graphql';

  static const String appScheme = "com.yolo";

  static String downloadLink = Platform.isAndroid
      ? "http://75.119.134.216:85/downloadUserWeeklyPlaner/"
      : "http://75.119.134.216:85/downloadUserWeeklyPlaner/";
}
