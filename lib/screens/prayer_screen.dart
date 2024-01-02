import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deen/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Center(child: Text("Prayer Screen"),),
    )
    );
  }
}
