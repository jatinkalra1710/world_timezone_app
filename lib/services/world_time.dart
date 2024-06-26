import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location = '';
  String time = '';
  String flag = '';
  String url = '';
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});
  Future <void> getTime() async {
    try{
      final link = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      final resp = await http.get(link);
      // print(time.body);
      Map data = jsonDecode(resp.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      String offset_min = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offset_min)));

      isDayTime = (now.hour > 6 && now.hour < 19)? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught Error : $e');
      time = 'Could not get Time Data';
    }
  }

}


