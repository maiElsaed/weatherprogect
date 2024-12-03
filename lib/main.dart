import 'package:demo_weather_app/screens/splash_screen.dart';
import 'package:demo_weather_app/services/temperature_unit_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemperatureProvider(Dio()),
      child: const CustomSearchBarApp(),
    ),
  );
}
class CustomSearchBarApp extends StatelessWidget {
  const CustomSearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
      // home: const SplashScreen(),
    );
  }
}
