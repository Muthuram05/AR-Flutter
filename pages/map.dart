import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng( 9.9252,78.1198);
  static const LatLng destination = LatLng( 13.0827,80.2707);
  static const LatLng destination2 = LatLng( 7.33609383,8.07600055);
  List<Marker> _marker = [];

  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId("1"),
        position: sourceLocation,
        infoWindow: InfoWindow(
            title: 'Source'
        )
    ),
    Marker(
        markerId: MarkerId("2"),
      position: destination,
      infoWindow: InfoWindow(
        title: 'Destination'
      )
    ),
    Marker(
        markerId: MarkerId("3"),
        position: destination2,
        infoWindow: InfoWindow(
            title: 'Destination2'
        )
    ),
  ];
  LocationData? currentLocation;
 location() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      if (!mounted) {

      } else {
        setState(() {

        });
      }
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    location();
    _marker.addAll(_list);
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
      body: currentLocation == null ? Center(child: const Text("Loading....")) : GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
            zoom: 13.5

        ),
        buildingsEnabled: true,
        indoorViewEnabled: true,
        polylines: {
          Polyline(
            polylineId: PolylineId('1'),
            points:[LatLng(currentLocation!.latitude!,currentLocation!.longitude!),sourceLocation,destination],
            color: Colors.orange,
            width: 4
          )
        },
        markers:{
          Marker(
              markerId: MarkerId("1"),
              position: sourceLocation,
              infoWindow: InfoWindow(
                  title: 'Destination1'
              )
          ),
          Marker(
              markerId: MarkerId("2"),
              position: destination,
              infoWindow: InfoWindow(
                  title: 'Destination2'
              )
          ),
          Marker(
              markerId: MarkerId("3"),
              position: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
              infoWindow: InfoWindow(
                  title: 'You are Here'
              )
          ),
        },
      ),

    );
  }
}
