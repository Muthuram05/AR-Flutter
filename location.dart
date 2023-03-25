import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String time = "";
  String lon = "0";
  String lat = "0";

  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      DateTime timenow = DateTime.now();  //get current date and time
      time = timenow.hour.toString() + ":" + timenow.minute.toString() + ":" + timenow.second.toString();
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position.latitude);
      print(position.longitude);
        lon = position.longitude.toString();
        lat = position.latitude.toString();
      setState(() {

      });
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: Scaffold(
            appBar: AppBar(
              title:Text("Execute Code With Timer"),
              backgroundColor: Colors.redAccent,
            ),
            body: Container(
                height: 260,
                color: Colors.red.shade50,
                child: Column(
                  children: [
                    Text('$lon'),
                    Text('$lat'),
                    Center(
                      child: Text(time, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      //show time on UI
                    ),
                  ],
                )
            )
        )
    );
  }
}