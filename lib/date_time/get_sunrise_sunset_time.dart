 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
String Sunrise(String timeString) {
  // تنسيق الوقت المتوقع: "05:56 AM"
  final DateTime now = DateTime.now(); // الوقت الحالي

  var n=timeString[1];
  int sunriseTime=int.parse(n);
  print("////////////////////////////////////");
  print(now.hour);
  print(now.hour-sunriseTime);
  print("////////////////////////////////////");
  if(sunriseTime>now.hour){
    return '${(now.hour-sunriseTime).abs()} hourse before';
  }else {
    return '${(now.hour-sunriseTime).abs()} hourse after';
  }

 // return now.hour-sunriseTime;

}
String Sunset(String timeString) {
  // تنسيق الوقت المتوقع: "05:56 AM"
  final DateTime now = DateTime.now(); // الوقت الحالي

  var n=timeString[1];
  int sunriseTime=int.parse(n);
  print("////////////////////////////////////");
  print(now.hour-(sunriseTime+12));
  print("////////////////////////////////////");
  if(now.hour>(sunriseTime+12)){
    return '${(now.hour-(sunriseTime+12)).abs()} hourse after';
  }else{
    return '${(now.hour-(sunriseTime+12)).abs()} hourse before';
  }

}