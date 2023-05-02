import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:core';

//TODO: Arabic Utils, ex: support two items and plurals + numbers format

bool isLocaleArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode.contains('ar');
}

void logDebug(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

Size getWindowSize(BuildContext context) => MediaQuery.of(context).size;

bool isRTL(String text) {
  return intl.Bidi.detectRtlDirectionality(text);
}

const shortDurationInSec = 3;
const longDurationInSec = 6;

String getTodayWeekDay(String lang) {
  final current = DateTime.now();
  return DateFormat.EEEE(lang).format(current);
}

String getCurrentYear(String lang) {
  return DateFormat.y(lang).format(DateTime.now());
}

T? listGetOrNull<T>(int index, List<T> list) {
  if (index >= list.length || index < 0) {
    return null;
  }
  return list[index];
}

List<T> listTakeFirst<T>(int n, List<T> list) {
  if (list.length > n) {
    return list.take(n).toList();
  }
  return list;
}

void forEachIndexed<T>(
    List<T> list, void Function(int index, T element) block) {
  for (int i = 0; i < list.length; i++) {
    block(i, list[i]);
  }
}

String convertArabicNumbersToEnglish(String str) {
  return str
      .replaceAll("٠", "0")
      .replaceAll("١", "1")
      .replaceAll("٢", "2")
      .replaceAll("٣", "3")
      .replaceAll("٤", "4")
      .replaceAll("٥", "5")
      .replaceAll("٦", "6")
      .replaceAll("٧", "7")
      .replaceAll("٨", "8")
      .replaceAll("٩", "9");
}

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

Future<double> getFileSizeInMb(String filePath) async {
  final bytes = await File.fromUri(Uri.parse(filePath)).length();
  final kb = bytes / 1024;
  return kb / 1024; // in mb
}

Future<dynamic> waitFor(Duration duration) {
  final completer = Completer();
  Timer(duration, () {
    completer.complete();
  });
  return completer.future;
}

// shareText(String data) {
//   Share.share(data);
// }
//
// shareFile(File file) async {
//   try {
//     await Share.shareXFiles([XFile(file.path)]);
//   } catch (exception) {
//     debugPrint(exception.toString());
//   }
// }
//
// shareLink(String weeklyPlannerId) {
//   Share.share(Constants.downloadLink + weeklyPlannerId);
// }
