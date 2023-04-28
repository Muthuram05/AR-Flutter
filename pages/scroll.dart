import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  const Scroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10),),
            child: Stack(
              children:[
                Container(
                  width:300,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://t4.ftcdn.net/jpg/03/81/81/61/360_F_381816134_lKJwb9WBRj7YDhgqvSAlG1kTv5FoCQZo.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  child: Text("Buddha sculpture",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      Text("Thailand",style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                )
              ]
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10),),
            child: Stack(
              children:[ Container(
                width:300,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROiaA6zxkN32-YFjCrqannDSz070hbL-15bSpstqjdsnUyEnS3FiliQrrmdRBQsAE9kBw&usqp=CAUs"),
                  ),
                ),
              ),
                Positioned(
                    top: 10,
                    left: 20,
                    child: Text("Makalu Mountain",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      Text("Nepal",style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                )
                ]
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10),),
            child: Stack(
              children:[
                Container(
                width:300,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://img.freepik.com/premium-photo/pura-ulun-danu-bratan-bali-indonesia_158797-33.jpg?w=360"),
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 20,
                  child: Text("Ulun Danu Beratan",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.white,),
                    Text("Indonesia",style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              )
             ]
            ),
          ),
        ],
      ),
    );
  }
}
