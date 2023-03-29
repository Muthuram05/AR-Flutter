import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';


class mahal extends StatelessWidget {
  const mahal({Key? key}) : super(key: key);

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
  State<LocalAndWebObjectsView> createState() => _LocalAndWebObjectsViewState();
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ClipRRect(
                child: ARView(
                  onARViewCreated: onARViewCreated,
                ),
              ),
            ),
            Row(
              children: [
                Card(
                  color: Color(0xffFFB319),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap:  (){
                      setState(() {
                      x = 0;
                    });
                    arObjectManager.removeNode(localObjectNode!);
                    localObjectNode = null;
                    },
                    child: SizedBox(
                        height: 40,
                        width: 80,
                        child:  Center(child: Text("x=0",style: TextStyle(color: Color(0xffffffff)),))
                    ),
                  ),
                ),
                Card(
                  color: Color(0xffFFB319),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap:  (){
                      setState(() {
                      x = 10;
                    });
                    onLocalObjectButtonPressed();},
                    child: SizedBox(
                        height: 40,
                        width: 80,
                        child:  Center(child: Text("x=10",style: TextStyle(color: Color(0xffffffff)),))
                    ),
                  ),
                ),

                Text("$x"),
              ],
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
        uri: "lib/assets/burj/burj.gltf",
        scale: Vector3(0.2, 0.2, 0.2),
        position: Vector3(0,0,0),
        rotation: Vector4(1.0, 0.0, 0.0, 0.0));
    bool? didAddLocalNode = await arObjectManager.addNode(newNode);
    localObjectNode = (didAddLocalNode!) ? newNode : null;
    // }
  }
}
