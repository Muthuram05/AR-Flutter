import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';


class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: createGame(),
      ),
    );
  }
}

class createGame extends StatefulWidget {

  const createGame({Key? key}) : super(key: key);
  @override
  State<createGame> createState() => _createGameState();
}

class _createGameState extends State<createGame> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

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
    return SingleChildScrollView(
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
                child: Icon(Icons.cancel_rounded,color: Color(0xFFffffff),size: 36,)
            ),
            Positioned(
                bottom: 20,
                left: 10,
                child: Icon(Icons.share,color: Color(0xFFffffff),size: 36,)
            ),
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * 0.34,
              child: ElevatedButton(onPressed: (){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name"),
                        TextField(),
                      ],
                    ),
                    content: SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hint"),
                          TextField(),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
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
          ],
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

