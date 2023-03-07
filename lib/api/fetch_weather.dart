
import 'dart:convert';

import 'package:weatherapp_starter_project/api/api_key.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/wheather_data_current.dart';

class FeatchWeatherAPI{
  WeatherData? weatherData;

  //processing the data from response -> json
  Future<WeatherData> processData(lat,lon) async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

String apiURL(var lat,var lon) {
  String url;
  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&exclude=minutely&units=metric";
  return url;
}