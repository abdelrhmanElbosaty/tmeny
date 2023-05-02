
import 'dart:io';

enum ApiDeviceEnum { DESKTOP, IOS, ANDROID }

ApiDeviceEnum getDeviceType() {
  if (Platform.isAndroid) {
    return ApiDeviceEnum.ANDROID;
  } else if (Platform.isIOS) {
    return ApiDeviceEnum.IOS;
  } else {
    return ApiDeviceEnum.DESKTOP;
  }
}