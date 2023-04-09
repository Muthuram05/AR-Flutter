import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';


class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset password"),
        backgroundColor: Colors.deepPurple,
      ),
        body: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.email_outlined,color: Colors.deepPurple,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6 ,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.deepPurple,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Email',
                            border: InputBorder.none
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email)=>
                          email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
                  onPressed: resetPassword,
                icon: Icon(Icons.email_outlined),
                label: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 14),
                ),

              ),
            ],
          ),
        ),
    );
  }

  Future resetPassword() async{
    FocusScope.of(context).unfocus();
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    Fluttertoast.showToast(
        msg:"Password Reset Email Sent",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
    }
    on FirebaseAuthException catch (e){
      Fluttertoast.showToast(
          msg:e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).pop();
    }

  }
}
