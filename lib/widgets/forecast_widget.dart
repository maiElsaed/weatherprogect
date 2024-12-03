import 'package:demo_weather_app/models/weather_model.dart';
import 'package:demo_weather_app/services/temperature_unit_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../date_time/get_formated_date.dart';

class ForecastWidget extends StatelessWidget {
  final int temperatureCelsius = 14; // Example temperature
  final int highTempCelsius = 23; // Example high temperature
  final int lowTempCelsius = 14; // Example low temperature
  Days? days;

  ForecastWidget(this.days);

  @override
  Widget build(BuildContext context) {
    final tempUnitProvider = Provider.of<TemperatureProvider>(context);
    int temperature =
        tempUnitProvider.convertTemperature(temperatureCelsius.toDouble());
    // Convert both high and low temperatures
    int highTemp =
        tempUnitProvider.convertTemperature(highTempCelsius.toDouble());
    int lowTemp =
        tempUnitProvider.convertTemperature(lowTempCelsius.toDouble());

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 150,
          width: 340,
          decoration: BoxDecoration(
            color: const Color(0xFF3CCF3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white, // Border color
              width: 1.0, // Border width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      formatDate((days!.date).toString()),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                (days!.image!.contains("https:")
                                    ? "${days!.image!}"
                                    : "https:${days!.image!}"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${tempUnitProvider.selectedUnit == "Celsius" ? '${days!.minTemp_c} C' : '${days!.minTemp_f} F'}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${days!.WeatherCondition}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '${tempUnitProvider.selectedUnit == "Celsius" ? '${days!.maxTemp_c} ' : '${days!.maxTemp_f} '}/ ${tempUnitProvider.selectedUnit == "Celsius" ? '${days!.minTemp_c} ' : '${days!.minTemp_f} '}°',
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
