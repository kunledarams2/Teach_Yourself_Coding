import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MassWeight extends StatefulWidget {
  @override
  _MassWeightState createState() => _MassWeightState();
}

/**
 * https://www.livescience.com/33356-weight-on-planets-mars-moon.html
   Mercury: 0.38
    Venus: 0.91
    Earth: 1.00
    Mars: 0.38
    Jupiter: 2.34
    Saturn: 1.06
    Uranus: 0.92
    Neptune: 1.19
    Pluto: 0.06
  **/

class _MassWeightState extends State<MassWeight> {
  int radioValue = 0;
  final TextEditingController _textEditingController =
      new TextEditingController();
  double _finalResult =0.0;

  void radioValueChangeHandle(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0: _finalResult = weightCalculator(_textEditingController.text, 0.06 );
        break;
        case 1: _finalResult = weightCalculator(_textEditingController.text, 0.38 );
        break;
        case 2: _finalResult = weightCalculator(_textEditingController.text, 0.91 );
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weight Planet x"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Image.asset("assests/planetImage.jpg"),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, top: 40, right: 30),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Weight",
                    hoverColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                    hintText: "Enter your weight",
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    )),
              ),
            ),
//            Container(
//              height: 50,
//              width: 200,
//              margin: EdgeInsets.only(top: 30),
//              child: RaisedButton(
//                onPressed: () {},
//                color: Colors.blue,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(5)),
//                child: Text(
//                  "Calculate",
//                  style: TextStyle(color: Colors.white),
//                ),
//              ),
//            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: radioValueChangeHandle,
                    activeColor: Colors.brown,
                  ),
                  Text(
                    "Pluto",
                    style: TextStyle(color: Colors.white30),
                  ),
                  Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: radioValueChangeHandle,
                    activeColor: Colors.red,
                  ),
                  Text(
                    "Mars",
                    style: TextStyle(color: Colors.white30),
                  ),
                  Radio<int>(
                    value: 2,
                    groupValue: radioValue,
                    onChanged: radioValueChangeHandle,
                    activeColor: Colors.orangeAccent,
                  ),
                  Text(
                    "Venus",
                    style: TextStyle(color: Colors.white30),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "You are  $_finalResult  weight",
                    style: TextStyle(color: Colors.white),
                  ),
//                  Container(
//                    margin: EdgeInsets.only(top: 10),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(right: 40),
//                          child: Text("Planet"),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40.0),
//                          child: Text("Weight"),
//                        )
//                      ],
//                    ),
//                  ),
//                  Container(
//                    margin: EdgeInsets.only(top: 10),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(right: 40),
//                          child: Text("Planet"),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 40.0),
//                          child: Text("Weight"),
//                        )
//                      ],
//                    ),
//                  ),
                ],
              ),
            )
          ],
        )));
  }

  double weightCalculator(String radioValue, double multip) {

    if(int.parse(radioValue.toString()) >0 && multip >0 ){
      return int.parse(radioValue.toString()) * multip;
    } else{
      return  0.0*0.38;
    }
  }
}
