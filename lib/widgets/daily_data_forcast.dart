import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/wheather_data_daily.dart';

import '../utils/custom_colors.dart';

class DailyDataForcast extends StatelessWidget {


  final WeatherDataDaily weatherDataDaily;
  const DailyDataForcast({Key? key,required this.weatherDataDaily}) : super(key: key);

  // string manipulation

  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day *1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),),
        child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style: TextStyle(color: CustomColors.textColorBlack,fontSize: 17),
            ),
          ),
          dailyList(),
       ],
    ),
    );
  }

  Widget dailyList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: weatherDataDaily.daily.length>7?7:weatherDataDaily.daily.length,
          itemBuilder: (context,index){
          return Column(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                    Text("${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°"),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
      }),
    );

  }
}
