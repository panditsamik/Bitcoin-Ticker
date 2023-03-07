# Bitcoin Ticker

A Flutter project that gives the current rates and exchange rates of Bitcoin currencies in different currencies, e.g. - USD, INR etc, through API, built in iOS style, i.e. it uses Cupertino Picker effect.

## Link to the API:
<https://rest.coinapi.io/v1/exchangerate/$bitcoinCurrency/$currency?apikey=${apiKey}>

##### Examples of API calls
<https://rest.coinapi.io/v1/exchangerate/LTC/USD?apikey=${apiKey}>

#### For more information :
<https://www.coinapi.io/>

For Documentation of Exchange Rates :
[Link](https://docs.coinapi.io/market-data/rest-api/exchange-rates)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Documentation and References :

## http 0.13.5
A composable, Future-based library for making HTTP requests.

This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform, and supports mobile, desktop, and the browser.

#### Use this package as a library
Depend on it
Run this command:

With Flutter:

```
dart pub add http
```

```
dependencies:
  http: ^0.13.5
```

#### Import it
Now in your Dart code, you can use:
```
import 'package:http/http.dart';
```

## Fetch data from the internet
Fetching data from the internet is necessary for most apps. Luckily, Dart and Flutter provide tools, such as the http package, for this type of work.

This recipe uses the following steps:

- Add the http package.
- Make a network request using the http package.
- Convert the response into a custom Dart object.
- Fetch and display the data with Flutter.

### 1. Add the http package
The http package provides the simplest way to fetch data from the internet.

To install the http package, add it to the dependencies section of the pubspec.yaml file. You can find the latest version of the http package the pub.dev.
```
dependencies:
  http: <latest_version>

```

Import the http package
```
import 'package:http/http.dart' as http;
```
Additionally, in your AndroidManifest.xml file, add the Internet permission.
```
<!-- Required to fetch data from the internet. -->
<uses-permission android:name="android.permission.INTERNET" />

```


### 2. Make a network request
```
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
```

### Complete example

```
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
```


### For more information :
[Link](https://docs.flutter.dev/cookbook/networking/fetch-data)

## Android Style
### Flutter – DropDownButton Widget:

In Flutter, A DropDownButton is a material design button. The DropDownButton is a widget that we can use to select one unique value from a set of values. It lets the user select one value from a number of items. The default value shows the currently selected value. We can even include a down arrow icon on the list. On clicking the DropDownButton it opens a list  of items, from which the user can select the desired option.

#### Flutter DropDownButton Constructor:
#### Syntax:

```
DropdownButton(
{Key key, 
@required List<DropdownMenuItem<T>> items, 
DropdownButtonBuilder selectedItemBuilder, 
T value, 
Widget hint, 
Widget disabledHint, 
@required ValueChanged<T> onChanged, 
VoidCallback onTap, 
int elevation: 8, 
TextStyle style, 
Widget underline, 
Widget icon, 
Color iconDisabledColor, 
Color iconEnabledColor, 
double iconSize: 24.0, 
bool isDense: false, 
bool isExpanded: false, 
double itemHeight: kMinInteractiveDimension,
Color focusColor, 
FocusNode focusNode, 
bool autofocus: false, 
Color dropdownColor
}
)
```

### Code:
```
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
```


## iOS style:
### CupertinoPicker class

An iOS-styled picker.

Displays its children widgets on a wheel for selection and calls back when the currently selected item changes.

By default, the first child in children will be the initially selected child. The index of a different child can be specified in scrollController, to make that child the initially selected child.

Can be used with showCupertinoModalPopup to display the picker modally at the bottom of the screen. When calling showCupertinoModalPopup, be sure to set semanticsDismissible to true to enable dismissing the modal via semantics.


#### Import it
Now in your Dart code, you can use:

```
import 'package:flutter/cupertino.dart';
```

Code :

```
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

```

```
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
                // Display a CupertinoPicker with list of currencies.
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
                // This displays the selected currency name.
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
```

## Screenshots:

![WhatsApp Image 2023-03-08 at 12 52 55 AM](https://user-images.githubusercontent.com/91545371/223544480-341a6f8c-2e37-463d-aa3f-8b9110bab6a0.jpeg)


![WhatsApp Image 2023-03-08 at 12 52 56 AM](https://user-images.githubusercontent.com/91545371/223544510-1b8e02cb-4f67-490f-baac-e2e76889110f.jpeg)



## Video:

https://user-images.githubusercontent.com/91545371/223544617-34150224-d437-4a57-afd7-170fd6222dfb.mp4

