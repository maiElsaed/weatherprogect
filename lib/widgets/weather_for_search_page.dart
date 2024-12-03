import 'package:demo_weather_app/models/weather_model.dart';
import 'package:demo_weather_app/services/temperature_unit_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherForSearchPage extends StatelessWidget {
  final String cityName;
  final int temperatureCelsius = 14; // Example temperature
  final int highTempCelsius = 23; // Example high temperature
  final int lowTempCelsius = 14; // Example low temperature

  const WeatherForSearchPage({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);
    final tempUnitProvider = Provider.of<TemperatureProvider>(context);
    // Convert both high and low temperatures
    int highTemp = tempUnitProvider.convertTemperature(highTempCelsius.toDouble());
    int lowTemp = tempUnitProvider.convertTemperature(lowTempCelsius.toDouble());
    return FutureBuilder<WeatherModel>(
        future: provider.getCurrentService(),
        builder: (BuildContext context, snapshot) {
    if (snapshot.hasData) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                height: 110,
                width: 340,
                decoration: BoxDecoration(
                  color: Color(0xFF3CCF3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data!.cityName}',
                                      style:const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                   const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                               const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    '${provider.selectedUnit == "Celsius" ? '${snapshot.data!.firstDay.minTemp_c} / ${snapshot.data!.firstDay.maxTemp_c} ' : '${snapshot.data!.firstDay.minTemp_f} / ${snapshot.data!.firstDay.maxTemp_f} '}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/sunrise.png'))),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${snapshot.data!.firstDay.WeatherCondition}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'your location',
                style: TextStyle(
                    color: const Color.fromARGB(255, 207, 200, 200),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    });

  }
}
