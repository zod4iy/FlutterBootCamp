import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ApiServiceProtocol {}

enum HttpMethod {
  get,
  post,
}

enum Error {
  clientError,
  serverError,
}

class BaseApiService implements ApiServiceProtocol  {
  HttpMethod method;
  String path;
  Map<String, String>? headers;

  BaseApiService({
    required this.path,
    required this.method,
  });

  Future<dynamic> perform() async {
    switch (method) {
      case HttpMethod.get:
        return _get(path);
      default: break;
    }
  }

  Future<dynamic> _get(String path) async {
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        print(response.statusCode);
        throw Error.clientError;
      } else {
        print(response.statusCode);
        throw Error.serverError;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class CoinApiService extends BaseApiService {
  static const _apiKey = 'A4879D10-DF0B-4E71-B69C-6E83150262B5';
  static const _basePath = 'https://rest.coinapi.io/v1/exchangerate/';

  CoinApiService() : super(path: _basePath,method: HttpMethod.get) {
   headers = {'X-CoinAPI-Key': _apiKey };
  }

  Future<dynamic> fetchExchangeRates({
    required String currency,
    required String coinName,
  }) async {
    try {
      path = '$_basePath$coinName/$currency';
      return perform();
    } catch (e) {
      print(e);
    }
  }
}

