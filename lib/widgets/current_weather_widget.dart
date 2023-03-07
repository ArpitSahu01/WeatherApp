import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/wheather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          // temperature area
          temperatureAreaWidget(),
          const SizedBox(height: 20,),
        //more details - windspeed, humidity, clouds
        currentWeatherMoreDetailsWidget(),

      ],
    );
  }

  Widget temperatureAreaWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(text: TextSpan(
          children: [
            TextSpan(
              text: "${weatherDataCurrent.current.temp?.toInt()}°",
              style: const TextStyle(
                fontSize: 68,
                fontWeight: FontWeight.w600,
                color: CustomColors.textColorBlack,
              ),
            ),
            TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),

          ]
        )),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset("assets/icons/windspeed.png"),
          ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
        ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 80,
              child: Text("${weatherDataCurrent.current.windSpeed}km/hr",
                style: TextStyle(fontSize: 12,),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 80,
              child: Text("${weatherDataCurrent.current.clouds}%",
                style: TextStyle(fontSize: 12,),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 80,
              child: Text("${weatherDataCurrent.current.humidity}%",
                style: TextStyle(fontSize: 12,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }


}
