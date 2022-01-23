import 'package:bitcoin/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency = currenciesList.first;
  String _btcValue = '1 BTC = ? ${currenciesList.first}';
  String _ethValue = '1 ETH = ? ${currenciesList.first}';
  String _ltcValue = '1 LTC = ? ${currenciesList.first}';

  CoinApiService apiService = CoinApiService();

  @override
  void initState() {
    super.initState();

    _fetchRates();
  }
  
  Future<void> _fetchRates() async {
    Future
      .wait([
        _fetchExchangeRateFor(coin: 'BTC'),
        _fetchExchangeRateFor(coin: 'ETH'),
        _fetchExchangeRateFor(coin: 'LTC'),
      ])
      .then((List responses) {
        for (dynamic exchangeCoinData in responses) {
          _updateCoinUI(exchangeCoinData);
        }
      })
      .catchError((e) => print(e));
  }

  Future<void> _fetchExchangeRateFor({required String coin}) async {
    var exchangeCoinData = await apiService.fetchExchangeRates(
        currency: _selectedCurrency, coinName: coin);
    _updateCoinUI(exchangeCoinData);
  }

  void _updateCoinUI(dynamic data) {
    setState(() {
      String coin = data['asset_id_base'];
      String currency = data['asset_id_quote'];
      double rate = data['rate'];
      int rateInteger = rate.toInt();

      if (coin == 'BTC') {
        _btcValue = '1 $coin = $rateInteger $currency';
      } else if (coin == 'ETH') {
        _ethValue = '1 $coin = $rateInteger $currency';
      } else if (coin == 'LTC') {
        _ltcValue = '1 $coin = $rateInteger $currency';
      }
    });
  }

  DropdownButton<String> _buildMaterialPicker() {
    List<DropdownMenuItem<String>> itemsList = [];
    for (String currency in currenciesList) {
      itemsList.add(
          DropdownMenuItem<String>(child: Text(currency), value: currency));
    }

    return DropdownButton<String>(
      value: _selectedCurrency,
      items: itemsList,
      onChanged: (value) {
        setState(() {
          _selectedCurrency = value ?? 'USD';
          _fetchRates();
        });
      },
    );
  }

  CupertinoPicker _buildCupertinoPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      children: pickerItems,
      onSelectedItemChanged: (selectedIndex) {
        _selectedCurrency = currenciesList[selectedIndex];
        _fetchRates();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      _btcValue,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      _ethValue,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      _ltcValue,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? _buildCupertinoPicker()
                : _buildMaterialPicker(),
          ),
        ],
      ),
    );
  }
}
