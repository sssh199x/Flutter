import 'package:bitcointickersecond/coin_data.dart';
import 'package:bitcointickersecond/cypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // CoinData coinData = CoinData();

  String selectedCurrency = 'AUD';

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(item);
    }
    return DropdownButton(
      borderRadius: BorderRadius.circular(15),
      value: selectedCurrency,
      icon: const Icon(Icons.currency_exchange),
      isExpanded: true,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> cupertinoPickerItems = [];
    for (String currency in currenciesList) {
      cupertinoPickerItems.add(Text(
        currency,
        style: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      ));
    }

    return CupertinoPicker(
        looping: true,
        magnification: 1.2,
        offAxisFraction: 0.4,
        squeeze: 1,
        backgroundColor: Colors.black12,
        itemExtent: 32.0,
        onSelectedItemChanged: (value) {
          selectedCurrency = currenciesList[value];
          getData();
        },
        children: cupertinoPickerItems);
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      CoinData coinData = CoinData();
      dynamic data = await coinData.getCoinData(selectedCurrency);
      isWaiting = false;

      setState(() {
        coinValues = data;
        // value = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  List<CryptoCard> getCryptoCard() {
    List<CryptoCard> cryptoCardList = [];
    for (String crypto in cryptoList) {
      cryptoCardList.add(
        CryptoCard(
            currencySelected: selectedCurrency,
            mulya: isWaiting ? '?' : coinValues[crypto]!,
            currencyCrypto: crypto),
      );
    }
    return cryptoCardList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: getCryptoCard(),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                  shape: const OutlineInputBorder(),
                  elevation: 15.0,
                  shadowColor: Colors.teal,
                  color: Colors.teal[200],
                  child: Platform.isAndroid ? iosPicker() : androidDropDown()),
            ),
          ),
        ],
      ),
    );
  }
}
