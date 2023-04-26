import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class startgame extends StatefulWidget {
  final name;
  const startgame({Key? key,required this.name,}) : super(key: key);

  @override
  State<startgame> createState() => startgameState();
}

class startgameState extends State<startgame> {
  LocationData? currentLocation;
  late double p1t = 0,p1g,p2t,p2g,p3t,p3g,p4t,p4g,p5t,p5g;
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
  Future retrieve() async{
    log("started");
    var url = "https://artravelar.000webhostapp.com/retrive.php";
    var response = await http.post(Uri.parse(url),body : {
      "name" :  widget.name,
    });
    if(response.body.isNotEmpty) {
      var data = json.decode(response.body);
      if(data == "Error"){
        Fluttertoast.showToast(
            msg:"Invalid Game",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else{
        setState(() {
          p1t =  double.parse(data[0]['place1lat']);
          p1g =  double.parse(data[0]['place1lng']);
          p2t =  double.parse(data[0]['place2lat']);
          p2g =  double.parse(data[0]['place2lng']);
          p3t =  double.parse(data[0]['place3lat']);
          p3g =  double.parse(data[0]['place3lng']);
          p4t =  double.parse(data[0]['place4lat']);
          p4g =  double.parse(data[0]['place4lng']);
          p5t =  double.parse(data[0]['place5lat']);
          p5g =  double.parse(data[0]['place5lng']);
        });
      }
    }
  }
  @override
  void initState(){
    super.initState();
    location();
    retrieve();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: p1t == 0 ? Center(child: Text("Loading...")): Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 730,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
                  zoom: 10
              ),
              buildingsEnabled: true,
              indoorViewEnabled: true,
              polylines: {
                Polyline(
                    polylineId: PolylineId('1'),
                    points:[
                      LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
                      LatLng(p1t, p1g),
                      LatLng(p2t, p2g),
                      LatLng(p3t, p3g),
                      LatLng(p4t, p4g),
                    ],
                    color: Colors.orange,
                    width: 4
                )
              },
              markers:{
                Marker(
                    markerId: MarkerId("1"),
                    position: LatLng( p1t, p1g),
                    infoWindow: InfoWindow(
                        title: 'Destination1'
                    )
                ),
                Marker(
                    markerId: MarkerId("2"),
                    position: LatLng( p2t, p2g) ,
                    infoWindow: InfoWindow(
                        title: 'Destination2'
                    )
                ),
                Marker(
                    markerId: MarkerId("3"),
                    position: LatLng( p3t, p3g),
                    infoWindow: InfoWindow(
                        title: 'Destination2'
                    )
                ),
                Marker(
                    markerId: MarkerId("4"),
                    position: LatLng( p4t, p4g),
                    infoWindow: InfoWindow(
                        title: 'Destination2'
                    )
                ),
                Marker(
                    markerId: MarkerId("4"),
                    position: LatLng( p5t, p5g),
                    infoWindow: InfoWindow(
                        title: 'Destination2'
                    )
                ),
                Marker(
                    markerId: MarkerId("me"),
                    position: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
                    infoWindow: InfoWindow(
                        title: 'You are Here'
                    )
                ),
              },
            ),
          ),
        ],
      ),

    );
  }
}


