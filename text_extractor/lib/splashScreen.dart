import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:text_extractor/homepage.dart';
class mySplashScreen extends StatefulWidget {
  const mySplashScreen({ Key? key }) : super(key: key);

  @override
  _mySplashScreenState createState() => _mySplashScreenState();
}

class _mySplashScreenState extends State<mySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Image to text converter',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      image:Image.asset("assets/imagetext.png"),
      photoSize: 130,
      backgroundColor: Colors.white,
      loaderColor: Colors.black,
      loadingText: Text(
        "from Coding Cafe",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }
}