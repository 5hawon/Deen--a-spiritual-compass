import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deen/models/aya_of_the_day.dart';
import 'package:deen/screens/pages/zakat_page.dart';
import 'package:deen/screens/spalsh_screen.dart';
import 'package:deen/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/hijri_calendar_page.dart';
import 'pages/prayer_time_page.dart';
import 'pages/qiblah_page.dart';
import 'pages/tasbih_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices _apiServices=ApiServices();
  AyaOfTheDay? ayaOfTheDay;
  void setData()async{
    final  prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }
  @override



  void initState() {
    // TODO: implement initState
    Future<AyaOfTheDay> m;
    setState(() {
    });


    super.initState();
    setData();
    fetchAyaOfTheDay();
  }
  void fetchAyaOfTheDay() async {

    try {
      final ayaData = await _apiServices.getAyaOfTheDay();
      print("shaown");
      print(ayaData.arText);
      setState(() {
        ayaOfTheDay =  ayaData;

      });
    } catch (error) {
      print("ok error");
      // Handle errors, e.g., show an error message
    }
  }

  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE,d MMM yyyy');
    var formatted = format.format(day);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background_img.jpg'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatted,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          style: TextStyle(fontSize: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.longMonthName,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hYear.toString(),
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Wrap GridView in Expanded widget
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white70, // Change to a darker color
              child: GestureDetector(
                onTap: () {
                  // Navigate to Zakat.dart when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZakatPage()),
                  );
                },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/zakat_icon.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        const SizedBox(height: 0), // Add spacing between image and text
                        Text(
                          "Zakat",
                          style: TextStyle(color: Colors.blueGrey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  ),



                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Zakat.dart when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QiblahPage()),
                        );
                      },
                    child: const Text("Qiblah"),
                  ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Zakat.dart when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TasbihPage()),
                        );
                      },
                      child: const Text("Tasbih"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Zakat.dart when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrayerTimePage()),
                        );
                      },
                      child: const Text("Prayer Time"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Zakat.dart when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HijriCalendarPage()),
                        );
                      },
                      child: const Text("Hizri Calender"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}