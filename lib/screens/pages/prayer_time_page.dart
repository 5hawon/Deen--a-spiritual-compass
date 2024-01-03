import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: PrayerTimePage(),
    theme: ThemeData(
      primaryColor: Colors.purple,
      fontFamily: 'NotoNaskhArabic',
    ),
  ));
}

class PrayerTimePage extends StatefulWidget {
  @override
  _PrayerTimePageState createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  late Coordinates myCoordinates;
  late PrayerTimes prayerTimes;

  @override
  void initState() {
    super.initState();
    myCoordinates = Coordinates(22.3752, 91.8349); // Replace with your own location lat, lng.
    calculatePrayerTimes();
  }

  Future<void> calculatePrayerTimes() async {
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final todayPrayerTimes = PrayerTimes.today(myCoordinates, params);

    setState(() {
      prayerTimes = todayPrayerTimes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prayer Times - أوقات الصلاة', style: TextStyle(fontSize: 24.0)),
        ),
        backgroundColor: Colors.purple.shade100,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (prayerTimes != null)
                PrayerTimeCard('Fajr - الفجر', DateFormat.jm().format(prayerTimes.fajr)),
              if (prayerTimes != null)
                PrayerTimeCard('Dhuhr - الظهر', DateFormat.jm().format(prayerTimes.dhuhr)),
              if (prayerTimes != null)
                PrayerTimeCard('Asr - العصر', DateFormat.jm().format(prayerTimes.asr)),
              if (prayerTimes != null)
                PrayerTimeCard('Maghrib - المغرب', DateFormat.jm().format(prayerTimes.maghrib)),
              if (prayerTimes != null)
                PrayerTimeCard('Isha - العشاء', DateFormat.jm().format(prayerTimes.isha)),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerTimeCard extends StatelessWidget {
  final String title;
  final String time;

  PrayerTimeCard(this.title, this.time);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.purple.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
