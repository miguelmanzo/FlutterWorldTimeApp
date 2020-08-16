import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_time_app/services/world_time.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        url: 'Europe/Berlin');

    await instance.getTime();

    Navigator.pushReplacementNamed(
        context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:
          SpinKitRotatingCircle(
            color: Colors.blueAccent,
            size: 80,
          ),
        ),
    );
  }
}
