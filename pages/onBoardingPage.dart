import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/login.dart';
import 'auth_page.dart';



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
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() =>
            isLastPage = index==3);
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/assets/image/onboarding0.png"),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Text("Ar View",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("It lets you search things visually, simply by pointing your camera at them. It can put answers right where your questions are by overlaying visual, immersive content on top of your real world.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/assets/image/onboarding1.jpg"),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Text("Ar View",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("It lets you search things visually, simply by pointing your camera at them. It can put answers right where your questions are by overlaying visual, immersive content on top of your real world.",
                    style: TextStyle(fontSize: 17),textAlign: TextAlign.justify,),

                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/assets/image/onboarding2.jpg"),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Text("Ar View",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("It lets you search things visually, simply by pointing your camera at them. It can put answers right where your questions are by overlaying visual, immersive content on top of your real world.",
                    style: TextStyle(fontSize: 17),textAlign: TextAlign.justify,),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/assets/image/onboarding3.png"),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Text("Ar View",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("It lets you search things visually, simply by pointing your camera at them. It can put answers right where your questions are by overlaying visual, immersive content on top of your real world.",
                    style: TextStyle(fontSize: 17),textAlign: TextAlign.justify,),
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
        color: Colors.teal.shade500,
            child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
              child: TextButton(
              onPressed: () async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthPage())
                );
              },
              child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
              ),
            ),
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