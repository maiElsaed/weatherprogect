import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class TemperatureProvider extends ChangeNotifier {
  // Default is Celsius
  final Dio dio;
  final String baseUrl='https://api.weatherapi.com/v1';
  final String apiKey='f249606ee84746829bb92812242006';
  String _cityName='المنوفيه';

  String _selectedUnit = 'Celsius';
  TemperatureProvider(this.dio);
  //WeatherModel? get WeatherModels => weatherModel;
  String get selectedCity => _cityName;
  void setCity(String city) {
    _cityName = city;
    notifyListeners(); // Notify widgets to rebuild with new value
  }

  Future<WeatherModel>  getCurrentService()async{
    try{
      print("first//////////////////////////////////////////");
      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$_cityName&days=7');
      print("second//////////////////////////////////////////");
      print(response.data);
      WeatherModel weatherModel=await WeatherModel.FromJson(response.data);
      print("/////////////////////////////////////////////");
      print(weatherModel);
      print("third//////////////////////////////////////////");

    //  notifyListeners();
      print("6776677767llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      return weatherModel;

    }on DioException catch(e){

      //هنا لؤ جاي nullحيرجه الكلمه الي بعده
      final String errMessage=e.response?.data['error']['message']??"there was an error ,try later";
      print("third//////////////////////////////////////////");
      print(errMessage);
      throw Exception(errMessage);
     // notifyListeners();
    }catch(e){
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror");
      log(e.toString());
      throw Exception('there was an error ,try later');
     // notifyListeners();
    }

  }
  String get selectedUnit => _selectedUnit;
  void setUnit(String newUnit) {
    _selectedUnit = newUnit;
    notifyListeners(); // Notify widgets to rebuild with new value
  }

  // Function to convert temperature based on selected unit and round the value
  int convertTemperature(double tempInCelsius) {
    if (_selectedUnit == 'Fahrenheit') {
      return ((tempInCelsius * 9 / 5) + 32).round(); // Rounds and returns as int
    }
    return tempInCelsius.round(); // Rounds and returns as int for Celsius
  }
}
