import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIAppScreen extends StatefulWidget {
  @override
  _BMIAppScreenState createState() => _BMIAppScreenState();
}

class _BMIAppScreenState extends State<BMIAppScreen> {

  final TextEditingController _bodyEditController = new TextEditingController();
  final TextEditingController _heightEditController = new TextEditingController();
  final TextEditingController _weightEditController = new TextEditingController();
  double result= 0.0;

  void calculateBMi(){
    setState(() {
      result = double.parse(_bodyEditController.text.toString())*
          double.parse(_heightEditController.text.toString()) *
          double.parse(_weightEditController.text.toString()) ;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
//              width: 80,
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Image.asset(
                "assests/bmilogo.png",
                width: 80,
              ),
            ),
            Container(
              width: 380,
              height: 300,
              child: Card(
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right:10.0,left: 10, top: 8),
                      child: TextField(
                        controller: _bodyEditController,
                        decoration: InputDecoration(
                          labelText: "Age",
                          icon: Icon(Icons.person_outline),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10.0,left: 10, top: 8),
                      child: TextField(
                        controller: _heightEditController,
                        decoration: InputDecoration(
                          labelText: "Height in feet",
                          icon: Icon(Icons.assessment),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10.0,left: 10, top: 8),
                      child: TextField(
                        controller: _weightEditController,
                        decoration: InputDecoration(
                          labelText: "Weight in lb",
                          icon: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.black,
                onPressed: () {
                  calculateBMi();
//                  print(_bodyEditController.text);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("$result"),)
          ],
        ),
      ),
    );
  }
}
