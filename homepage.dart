 import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'modle_page.dart';
import 'transulation_page.dart';
// class homepage extends StatefulWidget {
//   const homepage({Key? key}) : super(key: key);
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//   int _selectedIndex = 0;
//   List<IconData> data= const [
//     Icons.ac_unit_sharp,
//     Icons.star,
//     Icons.person,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       bottomNavigationBar:  Padding(
//         padding:  EdgeInsets.all(20),
//         child: Material(
//           elevation: 10,
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.deepOrange,
//           child: Container(
//             height: 70,
//             width: double.infinity,
//             child: ListView.builder(
//                 itemCount: 3,
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 itemBuilder:(ctx,i)=>Padding(
//                     padding:EdgeInsets.symmetric(horizontal: 40),
//                     child:GestureDetector
//                       (onTap:(){ setState(() {
//                   _selectedIndex = i;
//                 });},
//                     child: AnimatedContainer(
//                       duration: Duration(
//                         milliseconds: 250
//                       ),
//                       width: 35,
//                       // decoration: BoxDecoration(
//                       //
//                       //   gradient: i == _selectedIndex ? LinearGradient(
//                       //     colors: [Color(0xffFD841F),
//                       //     Color(0xffE14D2A),
//                       //     ],
//                       //     begin: Alignment.topCenter,
//                       //     end: Alignment.bottomCenter,
//                       //   ):null,
//                       // ),
//                       child: Card(
//
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//                           color: i == _selectedIndex ?Colors.white:Colors.deepOrange,
//                           child: SizedBox(
//                               width: 30,
//                               child: Icon(data[i],size: 35,color: i == _selectedIndex ?Colors.deepOrange:Colors.white,))),
//                     ),)
//                 ),
//               scrollDirection: Axis.horizontal,
//             )
//           ),
//           ),
//         ),
//
//
//       // BottomNavigationBar(
//       //     currentIndex: _currentIndex,
//       //     onTap: (int newIndex){
//       //       setState(() {
//       //         _currentIndex = newIndex;
//       //       });
//       //
//       //     },
//       //     items: [
//       //       BottomNavigationBarItem(
//       //         label: 'Camera',
//       //         icon:Icon(Icons.camera_alt_outlined),
//       //       ),
//       //       BottomNavigationBarItem(
//       //         label: 'Game',
//       //         icon:Icon(Icons.star),
//       //       ),
//       //       BottomNavigationBarItem(
//       //         label: 'Profile',
//       //         icon:Icon(Icons.person),
//       //       ),
//       //
//       //     ],
//       //   ),
//     );
//   }
// }






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
                     child: Text("travelAR", style: TextStyle(
                         fontFamily: 'MontserratAlternates',
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
             // Divider(
             //   height: 20,
             //   thickness: 5,
             //   indent: 45,
             //   endIndent: 45,
             //   color: Color(0xff7ec7c0),
             // ),
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

                       // child: ClipRRect(
                       //
                       //     child: Image.asset("lib/assets/image/tourist_guide.jpeg")
                       // ),


                   ),
                 ),
               ),
             ),




             // Subtittle
             Row(
               children:[ Padding(
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
             Padding(
                 padding: EdgeInsets.fromLTRB(40.0, 20.0, 50.0, 15.0),
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
                             MaterialPageRoute(builder: (context) =>  m_page()),);
                             },
                           child: SizedBox(
                             width: 130,
                             height: 130,
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
                         color: Color(0xffFFE194),
                         child:
                         InkWell(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => t_page()),);
                           },
                           child: SizedBox(
                             width: 130,
                             height: 130,
                             child:Center(
                               child:Image.asset("lib/assets/image/language.png"),
                             ),

                           ),
                         ),
                       ),
                     ],
                   ),

                   Card(
                     color: Color(0xff7ec7c0),
                     child:
                     InkWell(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => t_page()),);
                       },
                       child: SizedBox(
                         width: 130,
                         height: 294,
                         child:Center(
                           child: Image.asset("lib/assets/image/gamepad.png"),
                         ),

                       ),
                     ),
                   ),
                 ],
               ),
             )

           ],
         )
         ),
          
           
         
       
   
     );
   }
 }





