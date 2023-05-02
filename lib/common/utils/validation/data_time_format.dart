
import 'package:intl/intl.dart';

String convertDateToEnglishFullDate(DateTime date) {
  final currentDateTime = (DateFormat('E, d MMMM y').parse(DateFormat(
    'E, d MMMM y',
  ).format(date)));


  var result = DateFormat(
    'E, d MMMM y',
  ).format(currentDateTime);

  return result;
}
int getTimeStampOfDay(DateTime date) {
  return date.millisecondsSinceEpoch;
}
int dateTimeOfTomorrow(){
  var today=DateTime.now();
  final tomorrow = DateTime(
    today.year,
    today.month,
    today.day + 1,
  );
  return tomorrow.millisecondsSinceEpoch;
}
String convertTimeStampToEnglishFullDate(int timeStamp) {
  var x = DateTime.fromMillisecondsSinceEpoch(timeStamp);

  final currentDateTime = (DateFormat( 'y-MM-d').parse(DateFormat(
    'y-MM-d',
  ).format(x)));


  var result = DateFormat(
    'y-MM-d',
  ).format(currentDateTime);

  return result;
}

