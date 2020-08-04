import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import './components/donut_chart.dart';
import './components/progress_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Duration _duration = Duration(seconds: 1000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crunch Time'),
      ),
      body: Stack(
        children: <Widget>[
          DonutProgressBar(DonutProgressBar.createSampleData()),
          Center(
            child: Column(
              children: <Widget>[
                SlideCountdownClock(
                  duration: _duration,
                  slideDirection: SlideDirection.Down,
                  separator: ":",
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  onDone: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
