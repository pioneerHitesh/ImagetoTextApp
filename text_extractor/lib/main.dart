import 'package:flutter/material.dart';
import 'package:text_extractor/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image to text converter',
      home: mySplashScreen(),
    );
  }
}


