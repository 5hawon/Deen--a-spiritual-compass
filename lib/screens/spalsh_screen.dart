import 'dart:async';

import 'package:deen/screens/home_page.dart';
import 'package:deen/screens/home_screen.dart';
import 'package:deen/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  bool alreadyUsed= false;
  void getData() async{
    // Obtain shared preferences.
    final  prefs = await SharedPreferences.getInstance();
    alreadyUsed=prefs.getBool("alreadyUsed")?? false;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(Duration(seconds: 3), () =>
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return alreadyUsed? HomeScreen() :OnBoardingScreen();
          }),
        ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Center(child:Text("Deen",style: TextStyle(color: Colors.black,fontSize: 30),),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:Image.asset("assets/islamic.png"),
          ),
        ],
      ),
    );
  }
}
