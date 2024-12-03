import 'package:demo_weather_app/models/weather_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GetMessage{
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


  GetMessage(){
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // Use DarwinInitializationSettings for iOS
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Remove the onSelectNotification parameter from initialize method
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  Future<void> showNotification(WeatherModel? weatherModel) async {

     AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(
          checkWeatherConditions(weatherModel)
      ),
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      weatherModel!.cityName, // Notification Title
      "", // Notification Body
      platformChannelSpecifics,
      payload: 'Notification Payload', // Optional payload
    );
  }

  // Function to handle notification tap
  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      // Handle notification interaction (e.g., open a specific screen)
      print('Notification payload: $payload');
    }
  }
  String checkWeatherConditions(WeatherModel? weatherModel ) {
    weatherModel!.cityName;
    // c windSpeed=weatherModel.WindSpeed;
    // double pressure=weatherModel.Pressure;
    // int rainProbability=weatherModel.ChanceOfRain;
    Map<String,String>tips={};
    // تحديد المعدل الطبيعي لسرعة الرياح
    double minWindSpeed = 5.0;   // الحد الأدنى للرياح الهادئة
    double maxWindSpeed = 25.0;  // الحد الأقصى للرياح المعتدلة

    // فحص إذا كانت سرعة الرياح خارج المعدل الطبيعي
    if (weatherModel.WindSpeed< minWindSpeed || weatherModel.WindSpeed > maxWindSpeed) {
      print("تحذير: سرعة الرياح خارج المعدل الطبيعي!");
      tips.addAll({'windSpeed':'سرعة الرياح خارج المعدل الطبيعي!'});
    }else{
      tips.addAll({'windSpeed':'سرعة الرياح في المعدل الطبيعي!'});
    }

    // تحديد المعدل الطبيعي للضغط الجوي
    double minPressure = 980.0;   // الحد الأدنى للضغط الطبيعي
    double maxPressure = 1050.0;  // الحد الأقصى للضغط الطبيعي

    if (weatherModel.Pressure < minPressure || weatherModel.Pressure > maxPressure) {
      print("الضغط الجوي خارج المعدل الطبيعي!");
      tips.addAll({'pressure':'الضغط الجوي خارج المعدل الطبيعي!'});

    }else{
      tips.addAll({'pressure':'الضغط الجوي في المعدل الطبيعي!'});
    }

    // فحص احتمالية سقوط الأمطار
    if (weatherModel.ChanceOfRain > 50.0) {
      print("تحذير: احتمالية سقوط الأمطار عالية!");
      tips.addAll({'rainProbability': 'احتمالية سقوط الأمطار عالية'});
    }else{
      tips.addAll({'rainProbability': 'احتمالية سقوط الأمطار ضعيفه'});

    }
    String  ResultSentence=
       "${tips['windSpeed']},${tips["pressure"]},${tips["rainProbability"]}";
     return ResultSentence;
  }

}