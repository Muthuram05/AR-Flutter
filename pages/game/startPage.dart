import 'package:flutter/material.dart';
import 'start.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  final formKey = GlobalKey<FormState>();
  final registerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Form(
                  key : formKey,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value)=>
                    value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                    controller: registerController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Register Name',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    final isValid = formKey.currentState!.validate();
                    if(!isValid) return;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => start()));
                  },
                  child: const Text("next")),
            ],
          ),
        ]),
      ),
    );
  }
}
