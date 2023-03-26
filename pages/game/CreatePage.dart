import 'package:flutter/material.dart';
import '../../testing/test2.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Register Name',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => test()));
                  },
                  child: const Text("next")),
            ],
          ),
        ]),
      ),
    );
  }
}
