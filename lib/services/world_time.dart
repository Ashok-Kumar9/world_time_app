import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  WorldTime(this.time, this.location, this.isDayTime);
  String time;
  String location;
  bool isDayTime;

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/Asia/$location'));

      Map timeData = json.decode(response.body);

      String dateTime = timeData['datetime'];
      String offset = timeData['utc_offset'];

      DateTime timeNow = DateTime.parse(dateTime);

      timeNow = timeNow.add(
        Duration(
          hours: int.parse(offset.substring(1, 3)),
          minutes: int.parse(
            offset.substring(4, 6),
          ),
        ),
      );
      isDayTime = timeNow.hour > 6 && timeNow.hour < 18 ? true : false;
      time = DateFormat.jm().format(timeNow);
    }
    catch(e){
      print(e);
    }
  }
}
