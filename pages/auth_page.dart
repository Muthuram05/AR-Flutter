import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_ar/pages/onBoardingPage.dart';
import '../widgets/widget.dart';
import 'luq.dart';



class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return luq();
  }
}
