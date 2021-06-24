import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...............';
  bool isDay = false;

  Future<void> fetchTime() async {
    WorldTime myTime = WorldTime(time, 'Kolkata', isDay);
    await myTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': myTime.time,
      'location': myTime.location,
      'isDay': myTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchTime();
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}
