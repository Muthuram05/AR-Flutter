import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../keys.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng( 37.33500926,-122.03272188);
  static const LatLng destination = LatLng( 37.33429383,-122.06600055);
  static const LatLng destination2 = LatLng( 37.33609383,-122.07600055);
List<LatLng> polylineCoordinates =[LatLng( 37.33500926,-122.03272188),LatLng( 37.33429383,-122.06600055),LatLng( 37.33609383,-122.07600055)];
var  currentLocation;

void getCurrentLocation(){
  Location location = Location();

  location.getLocation().then((location) {
    currentLocation = location;
  });
  print(location.getLocation());
  print("currentLocation");
  print(currentLocation);
}

  void getPolyPoints() async{
  print("object");
    PolylinePoints polylinePoints = PolylinePoints();
    
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print(result.points);
    if(result.points.isNotEmpty){
      for (var point in result.points) {
        print(point);
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {

      });
    }
  }

  @override
  void initState(){
  getCurrentLocation();
    // getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track",
          style: TextStyle(color: Colors.black,fontSize: 16),
        ),
      ),
      body:GoogleMap(
        initialCameraPosition: CameraPosition(
            target: sourceLocation,
            zoom: 13.5
        ),
        polylines: {
          Polyline(
              polylineId : PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.black,
            width: 3
          )
        },
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          Marker(
            markerId: MarkerId("source"),
            position: destination2,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: destination,
            infoWindow: InfoWindow(
              title: "Destination"
            )
          ),
        },

      ),
    );
  }
}
