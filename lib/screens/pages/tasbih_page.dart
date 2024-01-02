import 'dart:async';
import 'package:flutter/material.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int _tasbihCount = 0;
  Timer? _timer;
  int _selectedMinutes = 1;
  int _remainingMinutes = 1;
  bool _timerExpired = false;

  List<String> duaList = [
    'رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ',
    'اللَّهُمَّ اجْعَلْنِي مِنَ الَّذِينَ إِذَا أَحْسَنُوا اسْتَبْشَرُوا وَإِذَا أَسَاءُوا اسْتَغْفَرُوا',
    'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ زَوَالِ نِعْمَتِكَ وَتَحَوُّلِ عَافِيَتِكَ وَفُجَاءَةِ نِقْمَتِكَ وَجَمِيعِ سَخَطِكَ',
    // Add more dua options here
  ];

  List<int> timerOptions = [1, 3, 5, 10];

  @override
  void initState() {
    super.initState();
    _remainingMinutes = _selectedMinutes;
  }

  void _incrementTasbih() {
    setState(() {
      _tasbihCount++;
    });
  }

  void _resetTasbih() {
    setState(() {
      _tasbihCount = 0;
      _timerExpired = false;
      _remainingMinutes = _selectedMinutes;
    });
    _startTimer();
  }

  void _startTimer() {
    const Duration tickDuration = Duration(seconds: 1);
    _timer = Timer.periodic(tickDuration, (Timer timer) {
      if (_remainingMinutes == 0) {
        setState(() {
          _timerExpired = true;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _remainingMinutes--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.purple[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        // Add this line to set the accent color
        hintColor: Colors.purpleAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tasbih Counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Timer Duration: ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    DropdownButton<int>(
                      value: _selectedMinutes,
                      onChanged: (value) {
                        setState(() {
                          _selectedMinutes = value!;
                          _remainingMinutes = _selectedMinutes;
                        });
                      },
                      items: timerOptions.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value Minutes',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    if (!_timerExpired) {
                      _incrementTasbih();
                    }
                  },
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // Change color to use purple shades
                      color: _timerExpired ? Colors.grey : Colors.purple[700],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple[700]!.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$_tasbihCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    // Always allow the user to count again after pressing reset
                    _resetTasbih();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  _timerExpired
                      ? 'Congratulations! Timer has expired!'
                      : 'Time Remaining: $_remainingMinutes Minutes',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: _timerExpired ? Colors.green : Colors.white,
                  ),
                ),
                SizedBox(height: 24.0),
                Expanded(
                  child: DuaWidget(duaList),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DuaWidget extends StatelessWidget {
  final List<String> duaList;

  DuaWidget(this.duaList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.purple[800],
        boxShadow: [
          BoxShadow(
            color: Colors.purple[800]!.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dua for Forgiveness:',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: duaList.length,
              itemBuilder: (context, index) {
                return Text(
                  duaList[index],
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(TasbihPage());
}
