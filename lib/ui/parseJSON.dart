import 'dart:convert' as convert;

import 'package:appstutorials/utili/StringCall.dart';
import 'package:appstutorials/utili/Urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParseJson extends StatefulWidget {
  @override
  _ParseJsonState createState() => _ParseJsonState();
}

class _ParseJsonState extends State<ParseJson> {
  var county = "";
  List mcountries = new List();

  @override
  void initState() {
    main();
  }

  void main() async {
    String countries =
        await StringCall().makeGetRequest(Urls.countriesUrl, null);
    var jsonResponse = convert.jsonDecode(countries);
    List countriesList = jsonResponse['countries'];

    print(countriesList.length);
    for (int i = 0; countriesList.length > i; i++) {
      mcountries.add(countriesList[i]["name"]);
      print("${mcountries.toString()}");
    }
    setState(() {});
  }

//  String  countries = getCountries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Parse JSON"),
        ),
        body: ListView.builder(
            itemCount: mcountries.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 3.5,
                    ),
                    ListTile(
                      title: Text( mcountries[position]),
                      leading: CircleAvatar(backgroundColor: Colors.black,
                      child: Text(mcountries[position][0]),),
                    )
                  ],
                ),
              );
            }));
  }

//  Future<String> getCountries() async {
//    https.Response response = await https.get(Urls.countriesUrl);
//     return response.body;
//  }
}
