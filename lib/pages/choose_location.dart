import 'package:flutter/material.dart';
import 'package:world_time_jatinkalra/services/world_time.dart';
import 'package:world_time_jatinkalra/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'https://thumbs.dreamstime.com/b/india-paper-flag-patriotic-background-national-138241478.jpg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://www.shutterstock.com/image-vector/united-kingdom-nation-flag-260nw-320882711.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'https://flagpedia.net/data/flags/w580/gr.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://cdn.britannica.com/85/185-004-1EA59040/Flag-Egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjTSB-3YLP2oJ-yPq2eGlxek6khPPPUtsP82q3cnI6RQ&s'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSheEcFXLimwYqldagpdx7xkm2QZD5ouY3O7f9hgv2KXA&s'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://cdn.britannica.com/48/1648-050-9C1F365D/Flag-Indonesia.jpg'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'https://img.freepik.com/free-vector/illustration-pakistan-flag_53876-27123.jpg'),
    WorldTime(location: 'Sydney', flag: 'https://cdn.britannica.com/78/6078-050-18D5DEFE/Flag-Australia.jpg' , url: 'Australia/Sydney'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context ,{'location':instance.location, 'flag':instance.flag,'time':instance.time , 'isDayTime':instance.isDayTime});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body : ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      locations[index].flag
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
