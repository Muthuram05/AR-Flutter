import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:travel_ar/widgets/signup.dart';
import '../widgets/login.dart';

class luq extends StatefulWidget {
  const luq({Key? key}) : super(key: key);
  @override
  State<luq> createState() => _luqState();
}

class _luqState extends State<luq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        enableSideReveal: true,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        positionSlideIcon: 0.9,
        pages: [
          login(),
          signup()
        ],
      ),
    );
  }
}
