import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deen/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Center(child: Text("Audi Screen"),),
    )
    );
  }
}
