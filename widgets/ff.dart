import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    List<String> countries = ["USA", "United Kingdom", "China", "Russia", "Brazil",
      "India", "Pakistan", "Nepal", "Bangladesh", "Sri Lanka",
      "Japan", "South Korea", "Mongolia"];

    return Scaffold(
        appBar: AppBar(
            title: Text("Show Scrollbar in Flutter"),
            backgroundColor: Colors.redAccent
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Scrollbar(
                isAlwaysShown: true, //always show scrollbar
                thickness: 10, //width of scrollbar
                radius: Radius.circular(20), //corner radius of scrollbar
                scrollbarOrientation: ScrollbarOrientation.left, //which side to show scrollbar
                child:ListView(
                  children: countries.map((country){
                    return Card(
                        child:ListTile(
                            title: Text(country)
                        )
                    );
                  }).toList(),
                )
            )
        )
    );
  }
}