import 'package:flutter/foundation.dart';

class WeatherModel {
  final String cityName;

  final double WindSpeed;
  final double Pressure;
  final int ChanceOfRain;
   final int Humidity;
  final String SunRise;
  final String SunSet;
  final Days firstDay;
  final Days SecondDay;
  final Days ThirdDay;
  WeatherModel({
    required this.cityName,
    required this.firstDay,
    required this.SecondDay,
    required this.ThirdDay,
    required this.ChanceOfRain,
    required this.Humidity,
    required this.Pressure,
    required this.SunRise,
    required this.SunSet,
    required this.WindSpeed,

  });
  factory WeatherModel.FromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      // date: DateTime.parse(json['current']['last_updated']),
      // maxTemp_c: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      // maxTemp2_c:json['forecast']['forecastday'][1]['day']['maxtemp_c'],
      // minTemp_c: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      // maxTemp_f: json['forecast']['forecastday'][0]['day']['maxtemp_f'],
      // minTemp_f: json['forecast']['forecastday'][0]['day']['mintemp_f'],
      // WeatherCondition: json['forecast']['forecastday'][0]['day']['condition']
      //     ['text'],
      // image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      ChanceOfRain: json['forecast']['forecastday'][0]['day']['daily_chance_of_rain'],
      Humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      WindSpeed: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      Pressure: json['current']['pressure_in'],
      SunRise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      SunSet: json['forecast']['forecastday'][0]['astro']['sunset'],
      firstDay:Days.FromJson(json,0) ,
      SecondDay: Days.FromJson(json,1),
      ThirdDay: Days.FromJson(json,2)
    );
  }
}
class Days {
  final DateTime date;
  final double maxTemp_c;
  final double minTemp_c;
  final double maxTemp_f;
  final double minTemp_f;
  final String? image;
  final String WeatherCondition;
  Days(
      {
        required this.date,
        required this.maxTemp_c,
        required this.minTemp_c,
        required this.maxTemp_f,
        required this.minTemp_f,
        required this.WeatherCondition,
        this.image,
        });
  factory Days.FromJson(json,int index) {
    return Days(
      date: DateTime.parse(json['forecast']['forecastday'][index]['date']),
      maxTemp_c: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
      minTemp_c: json['forecast']['forecastday'][index]['day']['mintemp_c'],
      maxTemp_f: json['forecast']['forecastday'][index]['day']['maxtemp_f'],
      minTemp_f: json['forecast']['forecastday'][index]['day']['mintemp_f'],
      WeatherCondition: json['forecast']['forecastday'][index]['day']['condition']
      ['text'],
      image: json['forecast']['forecastday'][index]['day']['condition']['icon'],
    );
  }
}
