import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'firstPage.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: appPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    ) ;
  }
}

class appPage extends StatelessWidget {
  const appPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homepage();
  }
}
