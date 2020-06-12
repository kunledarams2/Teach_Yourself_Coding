import 'package:appstutorials/ui/parseJSON.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmiApp.dart';
import 'massWeightApp.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 80),
              height: 50,
              width: 350,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MassWeight()));
                },
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: Text("Body Weight App"),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 40),
              height: 50,
              width: 350,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIAppScreen() ));
                },
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: Text("BMI App"),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
        Container(
          width: 350,
          height: 50,
          margin: EdgeInsets.only(top: 40, left: 40, right: 40),
          child: RaisedButton(

            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParseJson()));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.lightBlue,
            child: Text("Parse JSON", style: TextStyle(color: Colors.white),),
          ),
        )
      ],
        ));
  }
}
