import 'package:flutter/material.dart';
import '../assets_page/mahal.dart';


class module extends StatelessWidget {
  const module({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text("Tourist Spots", style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    color: Color(0xffFFB319),
                    fontSize: 35,
                  ),),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/mahal/untitled.gltf",)));
                        },
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child:Center(
                            child: Column(
                              children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/download-removebg-preview.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                               FittedBox(
                                    child: const Text("Taj Mahal", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name:"lib/assets/free__burj_khalifa_dubai/scene.gltf" ,)));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/Burj-Khalifa.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("Burj Khalifa Dubai", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/Sponza/Sponza.gltf",)));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/sponza.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("Sponza", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/colosseum_rome_italy/scene.gltf")));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/colosseum.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("Colosseum", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/wh/wh.gltf")));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/wh.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                      child: const Text("White House", style: TextStyle(
                                        fontFamily: 'MontserratAlternates',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/christ_the_redeemer/scene.gltf")));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/christ.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("Christ The Redeemer", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/the_great_pyramid_of_giza/scene.gltf")));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/pyramid.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("The Great Pyramid", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xff7ec7c0),
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>objectView(name: "lib/assets/vinh_stadium/scene.gltf")));
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child:Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("lib/assets/image/ving.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 150,
                                      height: 120,
                                    ),
                                  ),
                                  FittedBox(
                                    child: const Text("Vinh Stadium", style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
      ),
    );
  }
}

