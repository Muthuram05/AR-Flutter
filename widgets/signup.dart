import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_ar/widgets/login.dart';
import '../main.dart';
import '../pages/index.dart';

class signup extends StatefulWidget {
  // final Function() onClickedSignIn;
  const signup({Key? key, }) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.teal.shade300,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 30),
            child: Form(
              key : formKey,
              child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Row(
                      children: [
                        Text("Here\'s\nyour first  \nstep with\nus!",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500,color: Colors.white),),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("lib/assets/image/signup.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",style: TextStyle(color: Colors.teal.shade400),),
                            TextFormField(
                              cursorColor: Colors.deepPurple,
                              controller: emailController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                hintText: 'Enter Your Email',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (email)=>
                              email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text("Password",style: TextStyle(color: Colors.teal.shade400),),
                            TextFormField(
                              obscureText: true,
                              cursorColor: Colors.deepPurple,
                              controller: passwordController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                hintText: 'Enter Your Password',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value)=>
                              value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text("Confirm Password",style: TextStyle(color: Colors.teal.shade400),),
                            TextFormField(
                              obscureText: true,
                              cursorColor: Colors.deepPurple,
                              controller: passwordController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal.shade400),
                                ),
                                hintText: 'Enter Your Password',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value)=>
                              value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Center(
                              child: Container(
                                width: 220,
                                height: 40,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade400),
                                  ),
                                  onPressed: signUp,child: Text("Sign Up"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
  Future signUp() async {
    FocusScope.of(context).unfocus();
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      Fluttertoast.showToast(
          msg: "Account Successfully Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => IndexPage()),
      );
      final user = FirebaseAuth.instance.currentUser!;
      print(user.uid);

      final docUser = FirebaseFirestore.instance.collection('travelar').doc(user.uid);
      final json = {
        'name' : "User",
        'age' : "00/00/0000",
        'contact' : "0000000000",
        'profile' : "https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/image%2Fuser1.png?alt=media&token=8a31b66c-1bae-4317-917b-313130039b22"
      };
      await docUser.set(
          json
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => IndexPage()),);
    }
    on FirebaseException catch (e){
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e.toString());
    }

    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}