import 'package:flutter/material.dart';
import 'package:world_time_jatinkalra/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setWorldtime() async{
  WorldTime instance = WorldTime(location: 'Kolkata', flag: 'KK.png', url: 'Asia/Kolkata');
  await instance.getTime();
  Navigator.pushNamed(context, '/home',arguments: {'location':instance.location, 'flag':instance.flag,'time':instance.time , 'isDayTime':instance.isDayTime});
  }

  @override
  void initState() {
    super.initState();
    setWorldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
