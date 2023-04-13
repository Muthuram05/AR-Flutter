import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../pages/index.dart';
import '../main.dart';
import '../pages/forgotPassword.dart';


class login extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const login({Key? key, required this.onClickedSignUp}) : super(key: key);

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
    return Scaffold(
        body:  Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.0),
            child: Form(
              key : formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.account_circle,size: 30,color: Colors.deepPurple,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6 ,
                        child: TextFormField(
                        cursorColor: Colors.deepPurple,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Email'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email)=>
                        email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                    ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.lock,size: 30,color: Colors.deepPurple,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6 ,
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: Colors.deepPurple,
                          textInputAction: TextInputAction.done,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Your Password'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value)=>
                          value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  GestureDetector(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 14
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> forgotPassword()));
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: signIn,child: Text("Sign in"),
                  ),
                  RichText(text: TextSpan(
                    style: TextStyle(color: Colors.black,fontSize: 18),
                    text: 'Don\'t have an account ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        )
                      )
                    ]
                  ),
                  ),

                ],
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
     navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}
