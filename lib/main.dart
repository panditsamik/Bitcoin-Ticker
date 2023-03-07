import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey.shade800,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              '🤑 BitCoin Ticker',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        body: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  List<String> currenciesList = [
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
  List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

  // Original API Key : String apiKey = 'DB1FED3E-02FE-411A-8F06-A9ECEE8C3D71';
  String apiKey = 'AE457DD8-0FF7-4938-A21E-280E0302F380';
  var rate1;
  var rate2;
  var rate3;
  String dropdownvalue = 'USD';
  var currencyRate1 = '......';
  var currencyRate2 = '......';
  var currencyRate3 = '......';
  String currency = 'USD';
  var index1 = 0;

  void refreshData1() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/${cryptoList[0]}/$currency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        String data = response.body;
        var originData = jsonDecode(data);
        rate1 = originData["rate"];
        rate1 = rate1.toStringAsFixed(1);
        currencyRate1 = rate1;
        print(currencyRate1);
      });
    } else {
      print(response.statusCode);
    }
  }

  void refreshData2() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/${cryptoList[1]}/$currency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        String data = response.body;
        var originData = jsonDecode(data);
        rate2 = originData["rate"];
        rate2 = rate2.toStringAsFixed(1);
        currencyRate2 = rate2;
        print(currencyRate2);
      });
    } else {
      print(response.statusCode);
    }
  }

  void refreshData3() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/${cryptoList[2]}/$currency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        String data = response.body;
        var originData = jsonDecode(data);
        rate3 = originData["rate"];
        rate3 = rate3.toStringAsFixed(1);
        currencyRate3 = rate3;
        print(currencyRate3);
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Card(
                margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 8.0),
                elevation: 10.0,
                color: Colors.grey.shade700,
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '1 ${cryptoList[0]} = $currencyRate1 $dropdownvalue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 8.0),
                elevation: 10.0,
                color: Colors.grey.shade700,
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '1 ${cryptoList[1]} = $currencyRate2 $dropdownvalue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 8.0),
                elevation: 10.0,
                color: Colors.grey.shade700,
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '1 ${cryptoList[2]} = $currencyRate3 $dropdownvalue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.shade700,
          ),
          width: double.infinity,
          height: 150.0,
          alignment: Alignment.center,

          // DropDown Menu Item : Android Style
          /*
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: currenciesList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  Future.delayed(const Duration(microseconds: 5), () {
                    refreshData1();
                    refreshData2();
                    refreshData3();
                  });
                  setState(() {
                    dropdownvalue = newValue!;
                    currency = newValue;
                  });
                },
              ),
            ],
          ),
          */
          // Cupertino Picker : iOS style
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Selected Currency: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 1.5,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Display a CupertinoPicker with list of fruits.
                onPressed: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: 32.0,
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      Future.delayed(const Duration(microseconds: 5), () {
                        refreshData1();
                        refreshData2();
                        refreshData3();
                      });
                      setState(() {
                        index1 = selectedItem;
                        dropdownvalue = currenciesList[index1];
                        currency = currenciesList[index1];
                      });
                    },
                    children: List<Widget>.generate(currenciesList.length,
                        (int index) {
                      return Center(
                        child: Text(
                          currenciesList[index],
                        ),
                      );
                    }),
                  ),
                ),
                // This displays the selected fruit name.
                child: Text(
                  currenciesList[index1],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 20.5,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
