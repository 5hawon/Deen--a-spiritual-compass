import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deen/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Center(child: Text("Quran"),),
    )
    );
  }
}
