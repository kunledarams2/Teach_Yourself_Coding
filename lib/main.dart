import 'package:appstutorials/ui/homeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Flutter Basic App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
