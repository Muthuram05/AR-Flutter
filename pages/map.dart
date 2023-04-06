import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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



  @override
  void initState(){
    super.initState();
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
      body:GoogleMap(
        initialCameraPosition: CameraPosition(
            target: sourceLocation,
            zoom: 13.5
        ),
        markers:Set.of(_marker),
      ),
    );
  }
}
