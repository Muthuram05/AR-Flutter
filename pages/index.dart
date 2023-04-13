import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'pages.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int index = 2;
  final item = <Widget>[
    Icon(Icons.gamepad_outlined),
    Icon(Icons.camera),
    Icon(Icons.home),
    Icon(Icons.location_on_outlined),
    Icon(Icons.verified_user),
  ];

  final screens = [
    game(),
    module(),
    homepage(),
    MapSample(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.orange,
        height: 60,
        index: index,
        items: item,
        onTap: (index)=> setState(() => this.index = index),
      ),
    );
  }
}
