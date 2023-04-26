import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';


class createGame extends StatefulWidget {
  final gameName;
  const createGame({Key? key,required this.gameName}) : super(key: key);
  @override
  State<createGame> createState() => _createGameState();
}
final _hint = GlobalKey<FormState>();
int num = 1;
List items = [];

class _createGameState extends State<createGame> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  final nameController = TextEditingController();
  final hintController = TextEditingController();

  //String localObjectReference;
  ARNode? localObjectNode;
  var status = false;
  var object = false;
  //String webObjectReference;
  ARNode? webObjectNode;
  List latList = [];
  List lonList = [];

  late Position currentLocation;
  late LatLng _center;
  Future<Position> locateUser() async {
    return Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
  }
  @override
  void dispose() {
    arSessionManager.dispose();
    nameController.dispose();
    hintController.dispose();
    super.dispose();
  }
  Future save() async{
    log("started");
    print(latList);
    print(latList[0].toString());
    var url = "https://artravelar.000webhostapp.com/insert.php";
    var response = await http.post(Uri.parse(url),body : {
      "name" : widget.gameName,
      "plc1lat" : latList[0].toString(),
      "plc1lng" : lonList[0].toString(),
      "plc2lat" : latList[1].toString(),
      "plc2lng" : lonList[1].toString(),
      "plc3lat" : latList[2].toString(),
      "plc3lng" : lonList[2].toString(),
      "plc4lat" : latList[3].toString(),
      "plc4lng" : lonList[3].toString(),
      "plc5lat" : latList[4].toString(),
      "plc5lng" : lonList[4].toString(),
    });
      var data = json.decode(response.body);
      if(data == "Error"){
        Fluttertoast.showToast(
            msg:"Sometimes went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      if(data == "Sucess"){
        Fluttertoast.showToast(
            msg:"Game Saved",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pop(context);
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    // child: ClipRRect(
                    //   child: ARView(
                    //     onARViewCreated: onARViewCreated,
                    //   ),
                    // ),
                    child: Container(
                      color: Color(0xff000000),
                    ),
                  ),
               Positioned(
                  top: 20,
                  right: 10,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.cancel_rounded,color: Color(0xFFffffff),size: 36,))
                ),
              Positioned(
                  bottom: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: shareGame,
                      child: Icon(Icons.share,color: Color(0xFFffffff),size: 36,))
              ),
              Positioned(
                bottom: 10,
                left: MediaQuery.of(context).size.width * 0.34,
                child: Form(
                  key: _hint,
                  child: ElevatedButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            TextFormField(
                              validator: (value) {
                                if(value!= null){
                                  return "Name is Empty";
                                }
                              },
                              controller: nameController,
                            ),
                          ],
                        ),
                        content: SizedBox(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hint"),
                              TextFormField(
                                controller: hintController,
                                validator: (value)=>
                                value != null &&  value.length < 3 ? 'Enter min 3 characters' : null,
                              ),
                              // Text(error!)
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              final isValid = _hint.currentState!.validate();
                              if(!isValid) return;
                              getUserLocation();
                              if(latList.length < 5){
                                latList.add(_center.latitude);
                                lonList.add(_center.longitude);
                              }
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, child: Text("Place Clue")),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: (){
                      save();
                    },
                    child: Text("Save"),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
  Future shareGame() async{
    print("started");
    // final urlImage = 'https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/image%2Fapp_logo.png?alt=media&token=b134fd80-0717-4703-b08e-2df7976a7073';
    // final url = Uri.parse(urlImage);
    // final response = await http.get(url);
    // final bytes = response.bodyBytes;
    // final temp = await getTemporaryDirectory();
    // final path = '${temp.path}/image.jpg';
    await Share.share('check out my website https://artravelar.000webhostapp.com/fetch.php \n New Game is Available ${widget.gameName!}');
    print(widget.gameName);
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {

    this.arObjectManager = arObjectManager;

    this.arObjectManager.onInitialize();
  }

}



