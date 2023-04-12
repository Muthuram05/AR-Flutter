import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharma/pages/onBoardingPage.dart';
import 'pages/pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final prefs = await SharedPreferences.getInstance();
  // final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  // final bool showHome;
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text('Something Went Wrong!'),);
                }
                else if(snapshot.hasData){
                  return IndexPage();
                }
                else{
                  return AuthPage();
                }
              }
          )
      ),
    );
  }
}



