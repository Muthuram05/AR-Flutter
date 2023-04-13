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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: (){
                          uploadImage();
                        },
                        child: CircleAvatar(
                          maxRadius: 55,
                          minRadius: 55,
                          backgroundImage:NetworkImage(profile),
                        ),
                      ),
                      SizedBox(height: 10 ,),
                      if(name == "" && age == "" && phone == "")
                        CircularProgressIndicator(color: Colors.blue,),
                      Text(name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text(user.email!),
                      Text(age),
                      Text(phone),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.width * 0.08,
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                // if(userage != null)
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        edit_profile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> privacy()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(' Logout '),
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
    final docUser = FirebaseFirestore.instance.collection('travelar').doc(user.uid!);
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







