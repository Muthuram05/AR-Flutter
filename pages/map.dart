import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travel_ar/assets_page/objectMap.dart';


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
  static const LatLng dubai3 = LatLng( 9.9264,78.1200);
  static const LatLng dubai4 = LatLng( 9.9258,78.1196);


  static const LatLng tvl = LatLng( 13.0827,80.2707);
  static const LatLng tvl2 = LatLng( 9.9252,78.1198);
  static const LatLng tvl3 = LatLng( 9.9252,78.1198);
  static const LatLng tvl4 = LatLng( 9.9252,78.1198);

  LatLng fin = LatLng(0,0);
  LatLng fin2 = LatLng(0,0);
  LatLng fin3 = LatLng(0,0);
  LatLng fin4 =LatLng(0,0);
  LatLng fin5 = LatLng(0, 0);

  static const List<String> listItems = [
    'scad',
    'mumbai',
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
              if(item == 'scad'){
                fin = LatLng( 8.670655,77.57333);
                fin2 = LatLng(8.670655,77.573133);
                fin3 = LatLng(8.6699533,77.5731867);
                fin4 = LatLng(8.6692956,77.5730787);
                fin5 = LatLng(8.6682365, 77.5727987);
              }
              if(item == 'mumbai'){
                fin = LatLng( 18.9217,72.8349);
                fin2 = LatLng( 18.9401,72.8353);
                fin3 = LatLng( 19.0290,72.8174);
                fin4 = LatLng( 18.9829,72.8195);
                fin5 = LatLng(19.1075,72.8260);
              }
              if(item == 'tvl'){
                fin = LatLng( 8.7028382,77.7283668);
                fin2 = LatLng(8.7028701,77.7284052);
                fin3 = LatLng(8.7042328,77.7299004);
                fin4 = LatLng( 8.7104482,77.7312197);
                fin5 = LatLng(8.713261,77.732047);
              }
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
          : fin == LatLng(0,0) ? Center(child: Text("Enter Place or This place not Register for Now "))
     : SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(
             height: 5,
           ),
           Container(
             height: 620,
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
                        points:[LatLng(currentLocation!.latitude!,currentLocation!.longitude!),fin,fin2,fin3,fin4,fin5],
                        color: Colors.orange,
                        width: 4
                      )
                    },
                    markers:{
                      Marker(
                          markerId: MarkerId("1"),
                          position: fin,
                          infoWindow: InfoWindow(
                              title: 'Destination1'
                          )
                      ),
                      Marker(
                          markerId: MarkerId("2"),
                          position: fin2,
                          infoWindow: InfoWindow(
                              title: 'Destination2'
                          )
                      ),
                      Marker(
                          markerId: MarkerId("3"),
                          position: fin3,
                          infoWindow: InfoWindow(
                              title: 'Destination3'
                          )
                      ),
                      Marker(
                          markerId: MarkerId("4"),
                          position: fin4,
                          infoWindow: InfoWindow(
                              title: 'Destination4'
                          )
                      ),
                      Marker(
                          markerId: MarkerId("5"),
                          position: fin5,
                          infoWindow: InfoWindow(
                              title: 'Destination5'
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
     ),

    );
  }
}


