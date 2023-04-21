import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_ar/widgets/signup.dart';
import '../pages/index.dart';
import '../main.dart';
import '../pages/forgotPassword.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   @override
   void dispose(){
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      color: Colors.white,
      child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key : formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Row(
                        children: [
                          Text("Already\nhave an \nAccount?",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.22,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("lib/assets/image/signin.png"),
                              ),
                            ),
                          )
                        ],

                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Text("Email",style: TextStyle(color: Colors.teal.shade400),),
                      TextFormField(
                        cursorColor: Colors.deepPurple,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                            hintText: 'Enter Your Email'),
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
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                            hintText: 'Enter Your Password'),
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
                            onPressed: signIn,child: Text("Sign in"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.teal.shade500,
                                fontSize: 14
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> forgotPassword()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
  Future signIn() async{
    FocusScope.of(context).unfocus();
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
     showDialog(context: context,
         barrierDismissible: false,
         builder: (context) => Center(child: CircularProgressIndicator(),)
     );
     try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      Fluttertoast.showToast(
          msg: "Login Successfully",
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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => IndexPage()),);
     }
     on FirebaseException catch(e){
       Fluttertoast.showToast(
           msg: e.message.toString(),
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}
