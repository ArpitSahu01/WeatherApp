
import 'dart:convert';

import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/wheather_data_current.dart';
import 'package:weatherapp_starter_project/models/wheather_data_hourly.dart';

import '../utils/api_url.dart';

class FeatchWeatherAPI{
  WeatherData? weatherData;

  //processing the data from response -> json
  Future<WeatherData> processData(lat,lon) async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),WeatherDataHourly.fromJson(jsonString),);
    return weatherData!;
  }
}

