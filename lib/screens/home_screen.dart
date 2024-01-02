import 'package:flutter/material.dart';
import 'package:deen/screens/audio_screen.dart';
import 'package:deen/screens/home_page.dart';
import 'package:deen/screens/prayer_screen.dart';
import 'package:deen/screens/quran_screen.dart';
import 'package:deen/screens/pages/sign_in.dart';
import 'package:deen/screens/pages/sign_up.dart';
import 'package:deen/constants/constants.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> widgetList = [
    HomePage(),
    QuranScreen(),
    PrayerScreen(),
    AudioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgetList[selectedIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
                icon: Image.asset('assets/home.png', color: Colors.white),
                title: 'Home'),
            TabItem(
                icon: Image.asset('assets/user_tracker.png'),
                title: 'User Tracker'),
            TabItem(
                icon: Image.asset('assets/audio.png', color: Colors.white),
                title: 'Audio'),
            TabItem(
                icon: Image.asset('assets/mosque.png', color: Colors.white),
                title: 'Prayer'),
          ],
          initialActiveIndex: 0,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              if (index == 1) {
                // If the "User Tracker" tab is tapped (index 1), navigate to SignInPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              }
            });
          },
          backgroundColor: Constants.kPrimary,
          activeColor: Constants.kPrimary,
        ),
      ),
    );
  }
}