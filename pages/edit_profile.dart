import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'profile.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({Key? key}) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final profileKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top:8.0,bottom: 8.0,left: 20.0,right: 20.0
        ),
        child: Form(
          key : profileKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  readOnly: true,
                  controller: email,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: user.email!
                  ),
                ),
                TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>
                  value != null &&  value.length < 6  ? 'Enter min 6 characters' : null,
                ),
                TextFormField(
                  controller: phoneNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Phone No',
                      hintText: 'Enter Your Number'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>
                  value != null &&  value.length < 10  ? 'Enter Valid Number' : null,
                ),
                TextFormField(
                  controller: age,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter DOB',
                      hintText: 'Enter Your Date of Birth'),
                ),
                ElevatedButton(
                    onPressed: (){
                      edit();
                    },
                    child: Text("Submit")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  edit(){
    final isValid = profileKey.currentState!.validate();
    if(!isValid) return;
    final Name = name.text;
    final PhoneNo = phoneNo.text;
    final Age = age.text;
    createUser(Name:Name,mobileNo: PhoneNo,Age :Age);
    Navigator.pop(context);
  }
  Future createUser({required String Name , required String mobileNo, required String Age}) async{
    final docUser = FirebaseFirestore.instance.collection('travelar').doc(user.uid);
    final json = {
      'name' :Name,
      'age' : Age,
      'contact' : mobileNo,
    };
    await docUser.update(
        json
    );
  }
}
