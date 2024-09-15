import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final format = DateFormat('yyyy-MM-dd');
  return format.format(date);
}

// String getTime(int timeStamp) {
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
//   String formattedDate = DateFormat('HH:mm').format(dateTime);
//   return formattedDate;
// }

// String getDate(int timeStamp) {
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
//   String formattedDate = DateFormat('dd-MMM').format(dateTime);
//   return formattedDate;
// }

String getTime(String sDate) {
  DateTime parsedDate = DateTime.parse(
    '${sDate.substring(0, 4)}-${sDate.substring(4, 6)}-${sDate.substring(6, 8)}T${sDate.substring(8, 10)}:${sDate.substring(10, 12)}:${sDate.substring(12, 14)}',
  );
  DateTime d =
      DateFormat("yyyy-MM-dd HH:mm:ss").parse(parsedDate.toString(), true);

  return DateFormat('HH:mm').format(d.toLocal());
}

String getDate(String sDate) {
  DateTime parsedDate = DateTime.parse(
    '${sDate.substring(0, 4)}-${sDate.substring(4, 6)}-${sDate.substring(6, 8)}T${sDate.substring(8, 10)}:${sDate.substring(10, 12)}:${sDate.substring(12, 14)}',
  );
  return DateFormat('dd-MMM-yyyy').format(parsedDate);
}
