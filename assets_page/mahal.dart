import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_math/vector_math_64.dart';


class mahal extends StatelessWidget {
  final String name;
  const mahal({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: LocalAndWebObjectsView(name: name,),
        ),
    );
  }
}

class LocalAndWebObjectsView extends StatefulWidget {
  final String name;
  const LocalAndWebObjectsView({Key? key,required this.name}) : super(key: key);
  @override
  State<LocalAndWebObjectsView> createState() => _LocalAndWebObjectsViewState();
}

class _LocalAndWebObjectsViewState extends State<LocalAndWebObjectsView> {
  final GlobalKey _key = GlobalKey();
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  //String localObjectReference;
  ARNode? localObjectNode;
  var status = false;
  var object = false;
  //String webObjectReference;
  ARNode? webObjectNode;
  int x =  0;
  List userSearchItems = [];
  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
  void _capture() async{
    RenderRepaintBoundary boundary = _key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    if(boundary.debugNeedsPaint){
      Timer(Duration(seconds: 1) ,() =>_capture());
      return null;
    }
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if(byteData != null){
      Uint8List pngint = byteData.buffer.asUint8List();
      final saveImage = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngint),quality: 90,name: 'scrennshot-${DateTime.now()}.jpg' );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                SizedBox(
                  // child: Screenshot(
                  //   controller: controller,
                  //   child: Container(
                  //     color: Color(0xff000000),
                  //   ),
                  // ),
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                        child: RepaintBoundary(
                          key: _key,
                          child: ClipRRect(
                            child: ARView(
                              onARViewCreated: onARViewCreated,
                            ),
                          ),
                        ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width * 0.5) - 40,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: (){
                      object ?
                       null :
                      onLocalObjectButtonPressed(widget.name);
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: status ? CircularProgressIndicator() : Image.asset("lib/assets/image/camera.png"),
                    ),
                  ),
                ),
                object ?
                Positioned(
                  left: (MediaQuery.of(context).size.width * 0.2) - 40,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: (){
                      arObjectManager.removeNode(localObjectNode!);
                      localObjectNode = null;
                      setState(() {
                        object = false;
                      });
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset("lib/assets/image/remove.png"),
                    ),
                  ),
                ) :
                Container(),
                object ?
                Positioned(
                    left: (MediaQuery.of(context).size.width * 0.8) - 40,
                    bottom: 5,
                    child: InkWell(
                      onTap: () async{
                        _capture();
                      },
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset("lib/assets/image/screenshot.png"),
                      ),
                    )
                ) :
                Container()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async{
    await [Permission.storage].request();
    final time = DateTime.now().toIso8601String().replaceAll(".", "-").replaceAll(":", "-");
    final name = "TravelAr$time";
    final result = await ImageGallerySaver.saveImage(bytes,name: name);
    return result['filePath'];
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

  Future<void> onLocalObjectButtonPressed(name) async {
    setState(() {
      status = true;
    });
    var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: name,
        scale: Vector3(0.2, 0.2, 0.2),
        position: Vector3(0,0,0),
        rotation: Vector4(1.0, 0.0, 0.0, 0.0));
    bool? didAddLocalNode = await arObjectManager.addNode(newNode);
    localObjectNode = (didAddLocalNode!) ? newNode : null;
    setState(() {
      status = false;
      if(localObjectNode != null){
        object = true;
      }
    });
  }
}
