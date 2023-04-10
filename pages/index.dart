import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'pages.dart';



class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() =>
              isLastPage = index==3);
          },
          children: [
            Center(child: Container(child: Text("page 1"),)),
            Center(child: Container(child: Text("page 2"),)),
            Center(child: Container(child: Text("page 3"),)),
            Center(child: Container(child: Text("page 4"),)),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
          onPressed: () async{
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Index())
            );
          },
          child: Text("Get Started")
          )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(3),
                child:Text("SKIP")
            ),
            Center(
              child: SmoothPageIndicator(
                controller:controller,
                count:4,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
                onDotClicked: (index) => controller.animateToPage(index, duration: Duration(microseconds: 500), curve: Curves.easeIn),
              ),
            ),
            TextButton(
                onPressed: ()=> controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeInOut), child:Text("NEXT")
            )
          ],
        ),
      ),
    );
  }
}


class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int index = 2;
  final item = <Widget>[
    Icon(Icons.gamepad_outlined),
    Icon(Icons.camera),
    Icon(Icons.home),
    Icon(Icons.location_on_outlined),
    Icon(Icons.verified_user),
  ];

  final screens = [
    game(),
    module(),
    homepage(),
    MapSample(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.orange,
        height: 60,
        index: index,
        items: item,
        onTap: (index)=> setState(() => this.index = index),
      ),
    );
  }
}
