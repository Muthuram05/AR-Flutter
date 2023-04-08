import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  static const LatLng scad = LatLng(  9.9252,78.1198);
  static const LatLng scad4 = LatLng(13.0827,80.2707);
  static const LatLng scad2 = LatLng( 11.0168,76.9558);
  static const LatLng scad3 = LatLng(11.6643,78.1460);

  static const LatLng dubai = LatLng( 13.0827,80.2707);
  static const LatLng dubai2 = LatLng( 9.9252,78.1198);
  static const LatLng dubai3 = LatLng( 9.9252,78.1198);

  static const LatLng tvl = LatLng( 13.0827,80.2707);
  static const LatLng tvl2 = LatLng( 9.9252,78.1198);
  static const LatLng tvl3 = LatLng( 9.9252,78.1198);
  static const LatLng tvl4 = LatLng( 9.9252,78.1198);


  static const List<String> listItems = [
    'scad',
    'dubai',
    'tvl'
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
  void initState(){
    super.initState();
    location();
  }
  @override
  void dispose() {
    super.dispose();
  }
  var val = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        title: Autocomplete<String>(
          optionsBuilder: (textEditingValue){
            if(textEditingValue.text == ''){
              return const Iterable<String>.empty();
            }
            return listItems.where((String item){
              return item.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String item){
            setState(() {
              val = item;
            });
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                print(val);
              },
                child: Icon(Icons.search)
            ),
          )
        ],
      ),
      body: currentLocation == null ?
        Center(child: const Text("Loading...."))
          : val == "scad" ?
      GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
              zoom: 10
          ),
          buildingsEnabled: true,
          indoorViewEnabled: true,
          polylines: {
            Polyline(
              polylineId: PolylineId('1'),
              points:[LatLng(currentLocation!.latitude!,currentLocation!.longitude!),scad,scad2,scad3,scad4],
              color: Colors.orange,
              width: 4
            )
          },
          markers:{
            Marker(
                markerId: MarkerId("1"),
                position: scad,
                infoWindow: InfoWindow(
                    title: 'Destination1'
                )
            ),
            Marker(
                markerId: MarkerId("2"),
                position: scad2,
                infoWindow: InfoWindow(
                    title: 'Destination2'
                )
            ),
            Marker(
                markerId: MarkerId("3"),
                position: scad3,
                infoWindow: InfoWindow(
                    title: 'Destination2'
                )
            ),
            Marker(
                markerId: MarkerId("4"),
                position: scad4,
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
        ) : Center(child: Text("This place not Register for Now"))
    );
  }
}


