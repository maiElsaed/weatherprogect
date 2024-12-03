import 'package:intl/intl.dart';

String formatDate(String dateString) {
  // تحويل النص إلى كائن DateTime

  print("/////////////////////////////////////////////");
    print(dateString);
  print("/////////////////////////////////////////////");

  DateTime dateTime = DateTime.parse(dateString);

  // صيغة التاريخ المطلوبة
  DateFormat formatter = DateFormat('EEEE, d MMM');
  print('///////////////////////////////////////////////////////////////////');
  print(formatter.format(dateTime));
  // إعادة التاريخ بالشكل المطلوب
  return formatter.format(dateTime);
}