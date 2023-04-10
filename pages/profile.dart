import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () async{
        await FirebaseAuth.instance.signOut();
        navigatorKey.currentState!.popUntil((route)=>route.isFirst);
      }, child: Text("Logout"),)),
    );
  }
}
