import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_weather_app/pages/weather_settings.dart';
import 'package:rest_api_weather_app/providers/weather_provider.dart';
import 'package:rest_api_weather_app/utils/constants.dart';
import 'package:rest_api_weather_app/utils/helper_functions.dart';
import 'package:rest_api_weather_app/utils/styles.dart';

class WeatherHome extends StatefulWidget {
  static const String routeName = '/';

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  late WeatherProvider _provider;
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if(isFirst) {
      _provider = Provider.of<WeatherProvider>(context);
      _getData();
      isFirst = false;
    }

    super.didChangeDependencies();
  }

  void refreshData() {
    _getData();
  }

  void _getData() async {
    final position = await determinePosition();
    _provider.getCurrentWeatherData(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, WeatherSettings.routeName, arguments: refreshData),
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset('images/weather.jpg', width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover,),
          Center(
            child: _provider.currentWeatherModel == null ? CircularProgressIndicator() :
            buildWeatherSection(),
          )
        ],
      ),
    );
  }

  Column buildWeatherSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          getFormattedDate(
              _provider.currentWeatherModel!.dt!, 'EEE, MMM dd, yyyy'),
          style: txt16,
        ),
        Text(
          '${_provider.currentWeatherModel!.name}, ${_provider.currentWeatherModel!.sys!.country}',
          style: txt18,
        ),
        Text(
          '${_provider.currentWeatherModel!.main!.temp!.round()}\u00B0',
          style: txtTempBigStyle,
        ),
        Text(
          'Feels like: ${_provider.currentWeatherModel!.main!.feelsLike!.round()}\u00B0',
          style: txt22,
        ),
        Text(
          _provider.currentWeatherModel!.weather![0].description!,
          style: txt22,
        ),
        Image.network(
          '$icon_preffix${_provider.currentWeatherModel!.weather![0].icon}$icon_suffix',
        ),

      ],
    );
  }
}

