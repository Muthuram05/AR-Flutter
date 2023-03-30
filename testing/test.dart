import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Add clue")),
          ],
      ),
    );
  }
}
