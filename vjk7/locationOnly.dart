import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void getLocation() async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position.longitude);
    setState(() {
      lon = position.longitude.toString();
      lat = position.latitude.toString();
    });
  }
  String lon ="0";
  String lat ="0";
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SizedBox(height: 100,),
        SizedBox(height: 100,),
        ElevatedButton(
          onPressed:(){
            getLocation();
          },
          child: Text("location"),
        ),
        Text('Your Longitude: $lon '),
        Text('Your Altitude: $lat '),
  ]
    );
  }
}


