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
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
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
                SizedBox(height: 60,),
                InkWell(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
