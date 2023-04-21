import 'package:flutter/material.dart';
import 'pages.dart';

 class homepage extends StatelessWidget {
    const homepage({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body:
       Container(child:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // Navbar Tittle
             Padding(
               padding: EdgeInsets.fromLTRB(40.0, 0.0, 50.0,20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Center(
                     child: Text("TravelAR", style: TextStyle(
                         fontFamily: 'MontserratAlternates',
                         fontWeight:FontWeight.bold,
                         color: Color(0xffFFB319),
                       fontSize: 35,
                     ),),
                   ),

                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                     child: SizedBox(
                       width: 50,
                       height: 50,
                       child:Image.asset("lib/assets/image/travelAR_logo.png"),
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 30.0),
               child: Card(
                 color: Color(0xff7ec7c0),
                 child:
                 InkWell(
                   onTap: (){},
                   child: Container(
                     width: 290,
                     height: 140,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("lib/assets/image/tourist_guide.jpeg"),
                             fit: BoxFit.cover,
                         )
                       ),
                   ),
                 ),
               ),
             ),
             // Subtittle
              Row(
               children:[
                 Padding(
                 padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                 child: Text("Explore" , style: TextStyle(
                   fontFamily: "JosefinSans",
                   fontSize: 28,
                   color: Color(0xffFFB319),
                 ),),
               ),
            ],
             ),


            // Card boxes
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Padding(
                   padding: EdgeInsets.fromLTRB(40.0, 20.0, 50.0, 10.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Column(
                       children: [

                         //Camera
                         Card(
                           color: Color(0xffFFE194),
                           child:
                           InkWell(
                             onTap: (){
                               Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) =>  module()),);
                               },
                             child: SizedBox(
                               width: 120,
                               height: 100,
                               child:Container(
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("lib/assets/image/camera_img.png"),
                                   )
                                 ),
                               ),

                             ),
                           ),
                         ),
                         SizedBox(height: 15,),
                         Card(
                           color: Color(0xff7ec7c0),
                           child:
                           InkWell(
                             onTap: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) =>  MapSample()),);
                             },
                             child: SizedBox(
                               width: 120,
                               height: 100,
                               child:Container(
                                 decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage("lib/assets/image/guide_icon.png"),
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 5),
                       child: Card(
                         color: Color(0xff7ec7c0),
                         child:
                         InkWell(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) =>game()),);
                           },
                           child: SizedBox(
                             width: 114,
                             height: 230,
                             child:Center(
                               child: Image.asset("lib/assets/image/gamepad.png"),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             Card(
               color: Color(0xffFFE194),
               child:
               InkWell(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => translation()),);
                 },
                 child: SizedBox(
                   width: 250,
                   height: 100,
                   child:Center(
                     child:Image.asset("lib/assets/image/language.png"),
                   ),
                 ),
               ),
             ),
           ],
         )
         ),
     );
   }
 }