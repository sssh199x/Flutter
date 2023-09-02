import 'dart:convert';

import 'package:http/http.dart' as http;

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '75DAEC67-BEA1-4E0F-A7D5-A4B3EE3C4287';

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

class CoinData {
  CoinData();

  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Uri url =
          Uri.parse('$coinApiUrl/$crypto/$selectedCurrency/apikey-$apiKey/');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        double lastPrice = jsonData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print('HTTP STATUS CODE ERROR : ${response.statusCode}');
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
