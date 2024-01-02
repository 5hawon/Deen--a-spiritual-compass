import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        hintColor: Colors.purpleAccent,
        scaffoldBackgroundColor: Colors.purple[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
        ),
      ),
      home: QiblahPage(),
    ),
  );
}

class QiblahPage extends StatefulWidget {
  const QiblahPage({Key? key}) : super(key: key);

  @override
  State<QiblahPage> createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  double _currentHeading = 0.0;

  @override
  void initState() {
    super.initState();
    // Subscribe to the device orientation stream
    gyroscopeEvents.listen((GyroscopeEvent event) {
      // Update the heading based on the gyroscope data
      setState(() {
        _currentHeading = event.z * -1; // Adjust the sign as needed
      });
    });
  }

  String getDirection(double heading) {
    if (heading >= 0 && heading < 90) {
      return 'North-East';
    } else if (heading >= 90 && heading < 180) {
      return 'South-East';
    } else if (heading >= 180 && heading < 270) {
      return 'South-West';
    } else {
      return 'North-West';
    }
  }

  IconData getMarkerIcon(double heading) {
    if (heading >= 0 && heading < 90) {
      return Icons.arrow_forward;
    } else if (heading >= 90 && heading < 180) {
      return Icons.arrow_downward;
    } else if (heading >= 180 && heading < 270) {
      return Icons.arrow_back;
    } else {
      return Icons.arrow_upward;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qiblah Compass',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0, // Remove the shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: _currentHeading,
                      child: Image.asset(
                        'assets/compass.png',
                        width: 200.0,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Icon(
                      getMarkerIcon(_currentHeading),
                      color: Colors.red,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Text(
                'Heading: ${_currentHeading.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Direction to Qiblah: ${getDirection(_currentHeading)}',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
