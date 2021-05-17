import 'package:MathApp/FirstPage.dart';
//import 'package:MathApp/SingleDesign.dart';
import 'package:flutter/material.dart';

//import 'LandscapeMode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FirstPage(), //SingleDesign(), //LandscapeMode(),
      debugShowCheckedModeBanner: false,
    );
  }
}
