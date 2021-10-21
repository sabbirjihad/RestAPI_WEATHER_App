
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_weather_app/pages/weather_home.dart';
import 'package:rest_api_weather_app/pages/weather_settings.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'MerriweatherSans',
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            )
        ),
        initialRoute: WeatherHome.routeName,
        routes: {
          WeatherHome.routeName : (context) => WeatherHome(),
          WeatherSettings.routeName : (context) => WeatherSettings(),
        },
      ),
    );

  }
}

