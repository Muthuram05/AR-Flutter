import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages.dart';

final user = FirebaseAuth.instance.currentUser!;
var email = user.email?.split('@');
final emailMap = email?.asMap();
 class homepage extends StatelessWidget {
   homepage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length: 3,
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
                 SizedBox(height: 8,),
                 Row(
                   children: [
                     Container(
                       height: 35,
                       width: 35,
                       color: Colors.orange,
                       child: Image.asset("lib/assets/image/app_logo.png"),
                     )
                   ],
                 ),
                 TabBar(
                   indicatorColor: Colors.teal.shade300,
                   labelColor: Colors.orange, //<-- selected text color
                   unselectedLabelColor: Colors.black, //<-- Unselected text color
                   labelStyle: TextStyle(fontSize: 22.0,color: Colors.orange),  //For Selected tab
                   unselectedLabelStyle: TextStyle(fontSize: 16.0,color: Colors.black),
                   tabs: [
                     Tab(
                       child: Text(
                         "Trend",
                         style: TextStyle(fontWeight: FontWeight.w500),
                       ),
                     ),
                     Tab(
                       child: FittedBox(
                         child: Text(
                           "Translator",style: TextStyle(fontWeight: FontWeight.w500),
                         ),
                       ),
                     ),
                     Tab(
                       child: Text(
                         "Top",style: TextStyle(fontWeight: FontWeight.w500),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 500,
                   child:TabBarView(
                     children: [
                       Center(
                         child: Icon(Icons.confirmation_num_sharp)
                       ),
                       Center(
                         child: translation()
                       ),
                       Center(
                         child: Icon(Icons.alarm),
                       )
                     ],
                   ),
                 ),
             // Navigator.push(
             //   context,
             //   MaterialPageRoute(builder: (context) => translation()),);
               ],
             ),
           )
           ),
       ),
     );
   }
 }