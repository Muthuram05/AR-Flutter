import 'dart:async';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class guide extends StatefulWidget {
  const guide({Key? key}) : super(key: key);

  @override
  State<guide> createState() => _guideState();
}

class _guideState extends State<guide> {
   getLocation() async{
    print('object');

  }
  String lon ="0";
  String lat ="0";
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  //String localObjectReference;
  ARNode? localObjectNode;

  //String webObjectReference;
  ARNode? webObjectNode;

   @override
   void initState() {
      fun();
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: ARView(
                  onARViewCreated: onARViewCreated,
                ),
              ),
            ),
            Column(
              children: [
                    const Text("Current"),
                    Text('Longitude: $lon '),
                    Text('Altitude: $lat '),

              ],
            ),
          ],
        ),
      ),
    );
  }
  fun() async{
    Geolocator.checkPermission();
    Geolocator.requestPermission();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      DateTime timenow = DateTime.now();  //get current date and time
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position.latitude);
      print(position.longitude);
      setState(() {
        lon = position.longitude.toString();
        lat = position.latitude.toString();
      });
      //mytimer.cancel() //to terminate this timer
    });
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      // customPlaneTexturePath: "assets/triangle.png",
      showWorldOrigin: true,
      handleTaps: false,
    );
    this.arObjectManager.onInitialize();
  }
}
