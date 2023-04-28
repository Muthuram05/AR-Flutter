import 'package:flutter/material.dart';
import 'game/CreatePage.dart';
import 'game/startPage.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                      ColorFilter.mode(Colors.black.withOpacity(0.6),
                          BlendMode.dstATop),
                      fit: BoxFit.fill,
                      image: NetworkImage("https://previews.123rf.com/images/denisovd/denisovd1203/denisovd120301185/12705555-old-treasure-map.jpg")
                    ),
                  ),
                ),
                Positioned(
                  top: 450,
                  left: MediaQuery.of(context).size.width * 0.5 - 65,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePage()));},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      color: Colors.cyan,
                      child: SizedBox(
                        width: 130,
                        height: 50,
                        child: Center(child: Text("Create Game",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "JosefinSans",
                        ),)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: MediaQuery.of(context).size.width * 0.5 - 65,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>startPage()));},
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      color: Color(0xffFFB319),
                      child: SizedBox(
                        width: 130,
                        height: 50,
                        child: Center(child: Text("Start Game",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "JosefinSans",
                        ),)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

