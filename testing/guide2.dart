import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';


class guide2 extends StatelessWidget {
  const guide2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LocalAndWebObjectsView(),
      ),
    );
  }
}

class LocalAndWebObjectsView extends StatefulWidget {
  const LocalAndWebObjectsView({Key? key}) : super(key: key);

  @override
  State<LocalAndWebObjectsView> creaguide2ate() => _LocalAndWebObjectsViewState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _LocalAndWebObjectsViewState extends State<LocalAndWebObjectsView> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  //String localObjectReference;
  ARNode? localObjectNode;

  //String webObjectReference;
  ARNode? webObjectNode;
  int x =  0;
  List userSearchItems = [];
  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
              children:[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: ClipRRect(
                    child: ARView(
                      onARViewCreated: onARViewCreated,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height:MediaQuery.of(context).size.height * 1,
                    ),

                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              x = 10;
                            });
                            onLocalObjectButtonPressed();
                          },
                          child: const Text("x=10")),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              x = 0;
                            });
                            arObjectManager.removeNode(localObjectNode!);
                            localObjectNode = null;
                          },
                          child: const Text("x=0")),
                    ),
                    Expanded(  child: ElevatedButton(
                      onPressed: (){
                        showDialog(context: context,builder: (_) => AlertDialog(
                          content: Card(
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Clue',
                                    ),
                                  ),
                                  ElevatedButton(onPressed: (){}, child: Text("Place clue")),
                                ],
                              )
                          ),
                        ) );},
                      child:Icon(Icons.add),
                    )),
                    Text("$x"),
                  ],
                ),
              ]
          ),

        ],
      ),
    );
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
      customPlaneTexturePath: "assets/triangle.png",
      showWorldOrigin: true,
      handleTaps: false,
    );
    this.arObjectManager.onInitialize();
  }

  Future<void> onLocalObjectButtonPressed() async {
    // if (localObjectNode != null) {
    //   arObjectManager.removeNode(localObjectNode!);
    //   localObjectNode = null;
    // } else {
    var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: "lib/assets/siva/untitled.gltf",
        scale: Vector3(0.2, 0.2, 0.2),
        position: Vector3(0,0,0),
        rotation: Vector4(1.0, 0.0, 0.0, 0.0));
    bool? didAddLocalNode = await arObjectManager.addNode(newNode);
    localObjectNode = (didAddLocalNode!) ? newNode : null;
    // }
  }
}
