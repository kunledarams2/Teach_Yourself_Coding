import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BMIAppScreen extends StatefulWidget {
  @override
  _BMIAppScreenState createState() => _BMIAppScreenState();
}

class _BMIAppScreenState extends State<BMIAppScreen> {
  // https://www.epic4health.com/bmiformula.html
  /**
   * Body Mass Index can be calculated using pounds and inches with this equation

      BMI = (	            Weight in Pounds
      (Height in inches) x (Height in inches)	) x 703
      For example, a person who weighs 220 pounds and is 6 feet 3 inches tall has a BMI of 27.5.

      (	            220 lbs.
      (75 inches) x (75 inches)	) x 703 = 27.5

   **/

  final TextEditingController _ageEditController = new TextEditingController();
  final TextEditingController _heightEditController = new TextEditingController();
  final TextEditingController _weightEditController = new TextEditingController();
  double result= 0.0;
  double inches = 0.0;
  var resultValue = "";
  String _finalResult = "";

  void calculateBMi(){
    setState(() {
      int mAge = int.parse(_ageEditController.text);
      double mHeight = double.parse(_heightEditController.text);
      double mWeight = double.parse(_weightEditController.text);
      inches = mHeight * 12;
      if ((_ageEditController.text.isNotEmpty || mAge > 0) &&
          ((_heightEditController.text.isNotEmpty || mWeight > 0) &&
              (_weightEditController.text.isNotEmpty || inches > 0))) {
        result = mWeight / (inches * inches) * 703;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          resultValue = "Underweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          resultValue = "Great Shape";
        } else if (double.parse(result.toStringAsFixed(1)) >= 25 &&
            result < 30) {
          resultValue = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          resultValue = "Obese";
        }
      } else {
        Fluttertoast.showToast(
            msg: "Please enter all the details",
            toastLength: Toast.LENGTH_LONG);
        result = 0.0;
      }
    });

    _finalResult = "Your BMI is: ${double.parse(result.toStringAsFixed(1))}";
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
                        controller: _ageEditController,
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
              child: Text("$_finalResult",
                style: TextStyle(color: Colors.red, fontSize: 22),),),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("$resultValue",
                style: TextStyle(color: Colors.purpleAccent, fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}
