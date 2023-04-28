import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'privacy.dart';

import '../main.dart';
import 'edit_profile.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}
class _profileState extends State<profile> {
  UploadTask? uploadTask;
  var profile = "https://firebasestorage.googleapis.com/v0/b/newsapp-49d4e.appspot.com/o/file%2F200w.gif?alt=media&token=b1495033-0815-446e-9c33-f4a34bf27922";
  final user = FirebaseAuth.instance.currentUser!;
  var age = "";
  var name = "";
  var phone = "";
  @override
  void initState() {
    super.initState();
    readUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Center(child: Text("My Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: (){
                      uploadImage();
                    },
                    child: CircleAvatar(
                      maxRadius: 55,
                      minRadius: 55,
                      backgroundColor: Colors.teal,
                      backgroundImage:NetworkImage(profile),
                    ),
                  ),
                  SizedBox(width: 10 ,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (name == "" && age == "" && phone == "")
                        CircularProgressIndicator(),
                      Text(name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(user.email!,style: TextStyle(fontWeight: FontWeight.w100,fontSize: 12),),
                      Text(age),
                      Text(phone),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.08,
              ),
              Text("My Status",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 14),),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        color: Colors.black,
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Developer",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "JosefinSans",
                          ),)),
                        ),
                      ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      color: Colors.teal.shade200,
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: Center(child: Text("UI/UX",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "JosefinSans",
                        ),)),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      color: Colors.orange.shade100,
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: Center(child: Text("React",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "JosefinSans",
                        ),)),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      color: Colors.yellow.shade300,
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: Center(child: Text("Python",style: TextStyle(
                          color: Colors.white,
                          fontFamily: "JosefinSans",
                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.08,
              ),
              Text("Dashboard",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 14),),
              SizedBox(
                height:  MediaQuery.of(context).size.width * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          edit_profile()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                      children: [
                         CircleAvatar(
                            backgroundImage: AssetImage("lib/assets/image/edit_profile.png"),
                          ),
                        SizedBox(width: 20,),
                        Text("Edit Profile")
                      ],
                    ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          privacy()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("lib/assets/image/privacy2.png"),
                      ),
                      SizedBox(width: 20,),
                      Text("Privacy")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          privacy()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("lib/assets/image/likes.png"),
                      ),
                      SizedBox(width: 20,),
                      Text("Likes ")
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              Text("My Account",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 14),),
              ListTile(
                  title: const Text('Logout ',style: TextStyle(color: Colors.red),),
                  onTap: () async{
                    await FirebaseAuth.instance.signOut();
                    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
                  }
              ),
            ],
          ),
      ),
    );
  }
  readUser() async{
    final docUser = FirebaseFirestore.instance.collection("travelar").doc(user.uid);
    final snapshop = await docUser.get();
    if(snapshop.exists){
      setState(() {
        profile = User.fromJson(snapshop.data()!).profile;
        age = User.fromJson(snapshop.data()!).age;
        name = User.fromJson(snapshop.data()!).name;
        phone = User.fromJson(snapshop.data()!).contact;
      });
      return User.fromJson(snapshop.data()!);
    }
  }
  uploadImage() async{
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png','jpg','jpeg']
    );
    if(result == null){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No File Selected"),
          )
      );
      return null;
    }
    final fpath = result.files.single.path!;
    final fileName = result.files.single.name;
    final path = 'image/${fileName}';
    final file = File(fpath);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    final docUser = FirebaseFirestore.instance.collection('travelar').doc(user.uid);
    final json = {
      'profile' :urlDownload,
    };
    setState(() {
      profile = urlDownload;
    });
    await docUser.update(
        json
    );
  }
}
class User{
  String id;
  final String name;
  final String age;
  final String contact;
  final String profile;
  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.contact,
    required this.profile
  });

  static User fromJson(Map<String , dynamic > json) =>User(
      age : json['age'],
      contact: json['contact'],
      name: json['name'],
      profile: json['profile']
  );
}







