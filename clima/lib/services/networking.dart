import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BasicApiService {
  String? url;

  BasicApiService({this.url});

  Future<dynamic> performGetRequest() async {
    http.Response response = await http.get(
      Uri.parse(url ?? ''),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class ApiWeatherService extends BasicApiService {
  static const String apiKey = '74f903ea70161f3903e0a7dae7464d1e';
  static const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  ApiWeatherService() : super();

  Future<dynamic> fetchWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    try {
      String long = location.longitude.toString();
      String lat = location.latitude.toString();

      url = '$openWeatherMapURL?lat=$lat&lon=$long&appid=$apiKey&units=metric';
      return performGetRequest();
    } catch (e){
      print(e);
    }
  }

  Future<dynamic> fetchWeatherFor({required String cityName}) async {
    url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    return performGetRequest();
  }
}