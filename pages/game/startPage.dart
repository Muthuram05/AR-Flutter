import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'startGame.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  var name = "";
  late double p1t,p1g,p2t,p2g,p3t,p3g,p4t,p4g,p5t,p5g;
  Future retrieve() async{
    log("started");
    var url = "https://artravelar.000webhostapp.com/retrive.php";
    var response = await http.post(Uri.parse(url),body : {
      "name" : registerController.text,
    });
    if(response.body.isNotEmpty) {
      var data = json.decode(response.body);
      if(data == "Error"){
        Fluttertoast.showToast(
            msg:"Invalid Game",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else{
        setState(() {
          name = data[0]['name'];

        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => startgame(
              name: name,
        )));
      }
    }
  }
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
                    value != null &&  value.length < 6  ? 'Enter Valid Name' : null,
                    controller: registerController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Game Name',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    final isValid = formKey.currentState!.validate();
                    if(!isValid) return;
                    retrieve();
                  },
                  child: const Text("next")),
            ],
          ),
        ]),
      ),
    );
  }
}
