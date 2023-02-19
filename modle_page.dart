import 'package:flutter/material.dart';

import 'chicken_ar.dart';
import 'tree_ar.dart';
class m_page extends StatelessWidget {
  const m_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(

                child: Text("AR Models", style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  color: Color(0xffFFB319),
                  fontSize: 35,
                ),),
              ),

              Card(
                color: Color(0xff7ec7c0),
                child:InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>sponser_ar()));
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child:Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("lib/assets/image/hen.png"),
                          Text("Hen", style: TextStyle(
                            fontFamily: 'MontserratAlternates',
                            color: Colors.white,
                            fontSize: 25,
                          ),),
                        ],
                      ),
                    )
                  ),
                ),
              ),
              Card(
                color: Color(0xffFFB319),
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>chicken_ar()));
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("lib/assets/image/Fox.png"),
                          Text("Fox", style: TextStyle(
                            fontFamily: 'MontserratAlternates',
                            color: Colors.white,
                            fontSize: 25,
                          ),),
                        ],
                      ),
                    )
                    
                  ),
                ),
              ),
              Card(
                  color: Color(0xffFFE194),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
