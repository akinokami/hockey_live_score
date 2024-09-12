import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final format = DateFormat('yyyy-MM-dd');
  return format.format(date);
}

String getTime(int timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}
