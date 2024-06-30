// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/utils/colors.dart';

// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// ignore: camel_case_types
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.prymeryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Image.asset("images/splash_image.png"),
            ),
            Text("Verify your general \n knowledge of programming",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}