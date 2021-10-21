import 'package:flutter/material.dart';
import 'package:rest_api_weather_app/utils/helper_functions.dart';

class WeatherSettings extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _WeatherSettingsState createState() => _WeatherSettingsState();
}

class _WeatherSettingsState extends State<WeatherSettings> {
   bool isOn=false;
  late Function refreshFunction;
  @override
  void initState() {
    getTempStatus().then((value) {
      setState(() {
        isOn = value;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    refreshFunction = ModalRoute.of(context)!.settings.arguments as Function;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Settings'),
      ),
      body: Stack(
        children: [
          Image.asset('images/weather.jpg', width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover,),
          ListView(
            children: [
              SwitchListTile(
                value: isOn,
                onChanged: (value) async {
                  setState(() {
                    isOn = value;
                  });
                  await setTempStatus(isOn);
                  refreshFunction();
                },
                title: Text('Show temperature in Fahrenheit'),
                subtitle: Text('Default is Celsius'),
              )
            ],
          )
        ],
      ),
    );
  }
}

