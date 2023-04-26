import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'createGame.dart';
import 'package:http/http.dart' as http;


class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey = GlobalKey<FormState>();
  final registerController = TextEditingController();

  Future register() async{
    log("started");
    var url = "https://artravelar.000webhostapp.com/index.php";
    var response = await http.post(Uri.parse(url),body : {
      "name" : registerController.text,
    });
    if(response.body.isNotEmpty) {
      var data = json.decode(response.body);
      if(data == "Error"){
        Fluttertoast.showToast(
            msg:"This Name is Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      if(data == "Sucess"){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => createGame(gameName: registerController.text,)));
      }
    }
  }


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
                    register();
                    },
                  child: const Text("next")),
            ],
          ),
        ]),
      ),
    );
  }
}


