import 'package:intl/intl.dart';

String dateFormat(DateTime dateTime) {
  String time = DateFormat('dd.MM.yyyyг').format(dateTime);
  return time;
}
