import 'package:demo_weather_app/models/weather_model.dart';
import 'package:flutter/material.dart';

import '../date_time/get_sunrise_sunset_time.dart';

class SunsetWidget extends StatelessWidget {
  WeatherModel? weatherModel;
  late Duration duration;
  SunsetWidget(this.weatherModel);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 150,
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
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/sunset.png'))),
                    ),
                   const  SizedBox(
                      width: 15,
                    ),
                      Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${weatherModel!.firstDay.WeatherCondition}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            '${weatherModel!.SunSet}',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
               const Spacer(),
                Text(
                  Sunrise(weatherModel!.SunSet),
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
