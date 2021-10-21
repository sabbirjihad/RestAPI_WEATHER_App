import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rest_api_weather_app/models/current_weather_model.dart';
import 'package:http/http.dart' as Http;
import 'package:rest_api_weather_app/utils/constants.dart';
import 'package:rest_api_weather_app/utils/helper_functions.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherModel? currentWeatherModel;

  void getCurrentWeatherData(double lat, double lng) async {
    final status = await getTempStatus();
    final unit = status ? 'imperial' : 'metric';
    final Uri uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&units=$unit&appid=$weather_api_key');
    try {
      final response = await Http.get(uri);
      if(response.statusCode == 200) {
        final map = json.decode(response.body);
        currentWeatherModel = CurrentWeatherModel.fromJson(map);
        print(currentWeatherModel!.main!.temp);
        notifyListeners();
      }
    } catch(e) {
      throw e;
    }
  }
}