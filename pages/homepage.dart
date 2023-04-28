import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_ar/assets_page/objectMap.dart';
import 'package:travel_ar/pages/scroll.dart';
import 'pages.dart';

final user = FirebaseAuth.instance.currentUser!;
var email = user.email?.split('@');
final emailMap = email?.asMap();
 class homepage extends StatelessWidget {
   homepage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length: 2,
       child: Scaffold(
         body:  Container(child:
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 45,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Hi ${emailMap?[0]}!".toUpperCase(),style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w300
                     ),),
                     CircleAvatar(
                       backgroundColor: Colors.transparent,
                       backgroundImage: AssetImage("lib/assets/image/travelAR_logo.png"),
                     )
                   ],
                 ),
                 SizedBox(height: 8,),
                 Text("Let's Start",style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.w500
                 ),
                 ),
                 Row(
                   children: [
                     Text("your",style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.w500
                     ),),
                     Text("Travel !", style: TextStyle(
                       fontFamily: 'MontserratAlternates',
                       fontWeight:FontWeight.bold,
                       color: Color(0xffFFB319),
                       fontSize: 35,
                     ),
                     ),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Text("THERE IS A WORLD ELSEWHERE",style: TextStyle(
                   fontFamily: 'MontserratAlternates',
                   fontWeight:FontWeight.bold,
                   color: Color(0xffFFB319),
                   fontSize: 16,
                  ),
                 ),
                 SizedBox(height: 20,),
                 TabBar(
                   indicatorColor: Colors.teal.shade300,
                   labelColor: Colors.orange, //<-- selected text color
                   unselectedLabelColor: Colors.black, //<-- Unselected text color
                   labelStyle: TextStyle(fontSize: 22.0,color: Colors.orange),  //For Selected tab
                   unselectedLabelStyle: TextStyle(fontSize: 16.0,color: Colors.black),
                   tabs: [
                     Tab(
                       child: FittedBox(
                         child: Text(
                           "Most Visited",
                           style: TextStyle(fontWeight: FontWeight.w500),
                         ),
                       ),
                     ),
                     Tab(
                       child: FittedBox(
                         child: Text(
                           "Translator",style: TextStyle(fontWeight: FontWeight.w500),
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 500,
                   child:TabBarView(
                     physics: const NeverScrollableScrollPhysics(),
                     children: [
                       Center(
                         child: Scroll(),
                       ),
                       Center(
                         child: translation()
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           )
         ),
       ),
     );
   }
 }