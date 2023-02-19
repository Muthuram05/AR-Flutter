
import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            child: Image.asset("lib/assets/image/hi_image.png"),
          ),
        ),
      ),
    );
  }
}

