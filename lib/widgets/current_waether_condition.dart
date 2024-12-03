import 'package:demo_weather_app/models/weather_model.dart';
import 'package:demo_weather_app/services/temperature_unit_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CurrentWaetherCondition extends StatelessWidget {
   final int temperatureCelsius = 14; // Example temperature
  final int highTempCelsius = 23; // Example high temperature
  final int lowTempCelsius = 14; // Example low temperature
   WeatherModel? weathermodel;
   CurrentWaetherCondition(this.weathermodel);

  @override
  Widget build(BuildContext context) {
    // Access the selected temperature unit and conversion method
    final tempUnitProvider = Provider.of<TemperatureProvider>(context);
   int temperature = tempUnitProvider.convertTemperature(temperatureCelsius.toDouble());
    // Convert both high and low temperatures
    int highTemp = tempUnitProvider.convertTemperature(highTempCelsius.toDouble());
    int lowTemp = tempUnitProvider.convertTemperature(lowTempCelsius.toDouble());


    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 620,
          width: 340,
          decoration: BoxDecoration(
            color:const Color(0xFF3CCF3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white, // Border color
              width: 1.0, // Border width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/sun.png'))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${tempUnitProvider.selectedUnit == "Celsius" ? '${weathermodel!.firstDay.minTemp_c} C' : '${weathermodel!.firstDay.minTemp_f} F'}',
                      style:const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${weathermodel!.firstDay.WeatherCondition}',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'High: ${tempUnitProvider.selectedUnit == "Celsius" ? '${weathermodel!.firstDay.maxTemp_c} ' : '${weathermodel!.firstDay.maxTemp_f} '}',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      const  SizedBox(
                          height: 20,
                          child:  VerticalDivider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Low: ${tempUnitProvider.selectedUnit == "Celsius" ? '${weathermodel!.firstDay.minTemp_c} ' : '${weathermodel!.firstDay.minTemp_f} '}',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${weathermodel!.WindSpeed} ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Wind Speed',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weathermodel!.Pressure}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Pressure',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.cloudRain,
                          color: Colors.white,
                          size: 34,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weathermodel!.ChanceOfRain}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Chance of Rain',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.water_drop,
                          color: Colors.white,
                          size: 36,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weathermodel!.Humidity}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Humidity',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
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
