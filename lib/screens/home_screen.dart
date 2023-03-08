import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_data_forcast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>globalController.checkLoading().isTrue ? Center(child: CircularProgressIndicator(),)
            :Center(
              child: ListView(
          scrollDirection: Axis.vertical,
          children:  [
              const SizedBox(height: 20,),
              const HeaderWidget(),
              //from our current temp (current)
              CurrentWeatherWidget(weatherDataCurrent: globalController.getData().getCurrentWeather(),),
              const SizedBox(height: 20,),
              HourlyDataWidget(weatherDataHourly: globalController.getData().getHourlyWeather()),
              const SizedBox(height: 20,),
              DailyDataForcast(weatherDataDaily: globalController.getData().getDailyWeather()),
          ],
        ),
            )
        ),
      ),
    );
  }
}
