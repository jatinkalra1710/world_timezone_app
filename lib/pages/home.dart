import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;

    Map Nedata = jsonDecode(jsonEncode(data));
    // print(data);
    String bgImage = data['isDayTime']? 'https://cdn.wallpapersafari.com/32/77/PLdUvm.jpg':'https://wallpaperset.com/w/full/7/9/5/206188.jpg';
    Color bgColor = data['isDayTime']? Colors.brown : Colors.blueAccent ;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bgImage),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child : Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed:() async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {'time' : result['time'],'location' : result['location'],'isDayTime' : result['isDayTime'], 'flag' : result['flag'] };
                        });
                      },
                  icon: Icon(
                      Icons.edit_location_alt,
                      color: Colors.white,
                  ),
                  label: Text("Edit Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                  ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 38.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70.0,
                      color: Colors.white,
                      ),
                    ),
                ],
              )),
        ),
      ),
    );
  }
}
