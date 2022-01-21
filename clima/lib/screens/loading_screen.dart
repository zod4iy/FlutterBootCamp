import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();

    _getLocationData(completion: (weatherData) {
      _presentLocationScreen(weatherData: weatherData);
    });
  }

  void _getLocationData({required void Function(dynamic) completion}) async {
    ApiWeatherService weatherService = ApiWeatherService();

    var weatherData = await weatherService.fetchWeatherData();

    completion(weatherData);
    // var cityName = weatherData['name'];
    // print(cityName);
  }

  void _presentLocationScreen({required dynamic weatherData }) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}