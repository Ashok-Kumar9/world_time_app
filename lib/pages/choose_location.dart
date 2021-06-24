import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String time = 'Loading...............';
  bool isDay = false;

  @override
  Widget build(BuildContext context) {
    Widget photo = CircleAvatar(
      backgroundImage:
      NetworkImage('https://restcountries.eu/data/aus.svg'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
        elevation: 0,
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
      ),
    );
  }
}
