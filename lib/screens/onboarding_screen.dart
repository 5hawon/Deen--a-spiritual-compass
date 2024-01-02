import 'package:deen/constants/constants.dart';
import 'package:deen/screens/home_screen.dart';
import 'package:deen/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IntroductionScreen(
          pages:[
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Listen different Audio",
                      textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),

                    ),
                  ),


                ],
              ),
              image: Center(child: Image.asset('assets/quran.png',fit: BoxFit.fitWidth,)),
            ),
            PageViewModel(
              title: "Prayer Alerts",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "In which prayer you want to be notified",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),


                ],
              ),
              image: Center(child: Image.asset('assets/prayer.png',)),
            ),
            PageViewModel  (
              title: "Build Better Habit",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Make Islamic practices part of your daily life",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),


                ],
              ),
              image: Center(child: Image.asset('assets/zakat.png',)),
            ),
          ],
          onDone:(){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=>HomeScreen()));

          },

          showNextButton:true,

          next:const Icon(Icons.arrow_forward,color: Colors.black,),
          done:const Text("Done",style: TextStyle(fontWeight: FontWeight.w600,color:Colors.black),),
          dotsDecorator:DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0,10.0),
            activeColor: Constants.kPrimary,
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )



          )
        ),
      ),
    );
  }
}
