import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class text extends StatelessWidget {
  final GlobalKey _key = GlobalKey();
  text({Key? key}) : super(key: key);
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
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("for test"),
            RepaintBoundary(
              key: _key,
              child: Center(
                child: ElevatedButton(onPressed:_capture ,child: Text("click me"),),
              ),
            ),
          ],
        ),
      );
  }
}