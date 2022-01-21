import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();

    _getLocationData();
  }

  void _getLocationData() async {
    ApiWeatherService weatherService = ApiWeatherService();

    var weatherData = await weatherService.fetchWeatherData();

    var cityName = weatherData['name'];
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}