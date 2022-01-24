const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class Coin {
  final String name;
  String price = '?';
  String currency = currenciesList.first;

  String get resultText => '1 $name = $price $currency';
  set resultText(String newValue) => resultText = newValue;

  Coin({required this.name});
}

class CoinData {
  Map<String, Coin> coins = {};

  CoinData() {
    for (String crypto in cryptoList) {
      coins[crypto] = Coin(name: crypto);
    }
  }
}