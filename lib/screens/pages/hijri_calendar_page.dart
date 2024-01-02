import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.deepPurple),
          bodyText2: TextStyle(color: Colors.deepPurple),
        ),
      ),
      home: HijriCalendarPage(),
    ),
  );
}

class HijriCalendarPage extends StatefulWidget {
  const HijriCalendarPage({Key? key}) : super(key: key);

  @override
  State<HijriCalendarPage> createState() => _HijriCalendarPageState();
}

class _HijriCalendarPageState extends State<HijriCalendarPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late Map<DateTime, List> _events;
  late HijriCalendar _hijriDate;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _events = {}; // Add your events here
    _hijriDate = HijriCalendar.now(); // Initialize Hijri date
  }

  String getHijriDate() {
    HijriCalendar hijri = HijriCalendar.fromDate(_selectedDay);
    return '${hijri.toFormat("MMMM d, yyyy")}';
  }

  String getEnglishHijriDate() {
    final formatter = DateFormat('MMMM dd yyyy', 'en_US');
    final gregorianDate = hijriToGregorian(_hijriDate);
    final gregorianFormatted = formatter.format(gregorianDate);
    return '${_hijriDate.toFormat("MMMM dd yyyy")} - $gregorianFormatted';
  }

  DateTime hijriToGregorian(HijriCalendar hijriDate) {
    final gregorianDate = DateTime.utc(
      hijriDate.hYear,
      hijriDate.hMonth,
      hijriDate.hDay,
    );
    return gregorianDate;
  }

  void _showHijriInfoDialog() {
    // Get additional information based on the selected date
    String additionalInfo = getAdditionalInfo(_selectedDay);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hijri Date Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hijri Date:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              Text(
                getHijriDate(),
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'DancingScript',
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Hijri Date (Today):',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              Text(
                getEnglishHijriDate(),
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'DancingScript',
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Additional Info:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              Text(
                additionalInfo,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'DancingScript',
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String getAdditionalInfo(DateTime selectedDate) {
    // Example: Provide some significance based on the day of the month
    int day = selectedDate.day;
    if (day % 2 == 0) {
      return 'A special event happens on even days!';
    } else {
      return 'Celebrate uniqueness on odd days!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hijri Calendar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontSize: 22,
                color: Colors.deepPurple,
              ),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Hijri Date:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  getHijriDate(),
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'DancingScript',
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Hijri Date (Today):',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  getEnglishHijriDate(),
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'DancingScript',
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showHijriInfoDialog,
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            child: Text(
              'Show Hijri Date Info',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
