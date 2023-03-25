import 'package:flutter/material.dart';
import 'vjk7/homepage.dart';

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
