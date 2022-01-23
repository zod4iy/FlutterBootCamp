import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationData;

  const LocationScreen({Key? key, required this.locationData})
      : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  ApiWeatherService service = ApiWeatherService();

  int? _temperature;
  String? _weatherIcon;
  String? _message;

  @override
  void initState() {
    super.initState();
    _updateUI(weatherData: widget.locationData);
  }

  void _updateUI({required dynamic weatherData}) {
    setState(() {
      double? temp = weatherData['main']['temp'];
      _temperature = (temp ?? 0).toInt();

      var condition = weatherData['weather'][0]['id'];
      _weatherIcon = weatherModel.getWeatherIcon(condition);

      var cityName = weatherData['name'];
      _message = weatherModel.getMessage(_temperature ?? 0) + ' in ' + cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await service.fetchWeatherData();
                      _updateUI(weatherData: weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen(),
                          ),
                      );

                      if (typedName != null) {
                        var cityWeatherData = await service.fetchWeatherFor(cityName: typedName);
                        _updateUI(weatherData: cityWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$_temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      _weatherIcon ?? '',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  _message ?? '',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
