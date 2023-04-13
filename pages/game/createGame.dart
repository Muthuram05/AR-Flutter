import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'CreatePage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


class createGame extends StatefulWidget {
  final gameName;
  const createGame({Key? key,required this.gameName}) : super(key: key);
  @override
  State<createGame> createState() => _createGameState();
}

class _createGameState extends State<createGame> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  final nameController = TextEditingController();
  final hintController = TextEditingController();
  var error;
  //String localObjectReference;
  ARNode? localObjectNode;
  var status = false;
  var object = false;
  //String webObjectReference;
  ARNode? webObjectNode;
  List userSearchItems = [];
  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreatePage()));
                      },
                        child: Icon(Icons.cancel_rounded,color: Color(0xFFffffff),size: 36,))
                ),

              Positioned(
                  bottom: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () async {
                        final urlImage = 'https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/image%2Fapp_logo.png?alt=media&token=b134fd80-0717-4703-b08e-2df7976a7073';
                        final url = Uri.parse(urlImage);
                        final response = await http.get(url);
                        final bytes = response.bodyBytes;
                        final temp = await getTemporaryDirectory();
                        final path = '${temp.path}/image.jpg';
                        await Share.shareXFiles([XFile('${temp.path}/image.jpg')],text:"New Game is Available ${widget.gameName!}");
                      },
                      child: Icon(Icons.share,color: Color(0xFFffffff),size: 36,))
              ),
              Positioned(
                bottom: 10,
                left: MediaQuery.of(context).size.width * 0.34,
                child: Form(
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
                                if(value!.isEmpty){
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
                              ),
                              // Text(error!)
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              if(nameController.text.isEmpty){
                                setState(() {
                                  error = "Name is empty";
                                });
                              }
                              if(nameController.text.isEmpty){
                                setState(() {
                                  error = "Hint is empty";
                                });
                              }
                              Navigator.of(ctx).pop();
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
            ],
          ),
        ),
      ),
    );
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

