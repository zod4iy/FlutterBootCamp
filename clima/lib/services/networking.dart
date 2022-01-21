import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String kApiKey = '74f903ea70161f3903e0a7dae7464d1e';

class BasicApiService {
  String? url;

  BasicApiService({this.url});

  Future performGetRequest() async {
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
  ApiWeatherService() : super();

  Future fetchWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    try {
      String long = location.longitude.toString();
      String lat = location.latitude.toString();

      url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$kApiKey&units=metric';
      return performGetRequest();
    } catch (e){
      print(e);
    }
  }
}