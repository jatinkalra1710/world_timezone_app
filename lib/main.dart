import 'package:flutter/material.dart';
import 'package:world_time_jatinkalra/pages/home.dart';
import 'package:world_time_jatinkalra/pages/loading.dart';
import 'package:world_time_jatinkalra/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));