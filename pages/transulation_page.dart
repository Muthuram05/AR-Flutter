import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';
class t_page extends StatefulWidget {
  const t_page({Key? key}) : super(key: key);

  @override
  State<t_page> createState() => _t_pageState();
}

class _t_pageState extends State<t_page> {
  bool textScanning = false;
  XFile ? imageFile;
  String scannedText = "";
  String outputText = "";
  String dropdownvalue = 'Tamil';

  // List of items in our dropdown menu
  var items = [
    'Tamil',
    'Telugu',
    'Malayalam',
    'Hindhi',
    'Kannada',
  ];

  GoogleTranslator translator = GoogleTranslator();


 void getRecogonisedText(XFile image) async{
   final inputImage = InputImage.fromFilePath(image.path);
   final textDetector = GoogleMlKit.vision.textRecognizer();
   RecognizedText recognizedText = await textDetector.processImage(inputImage);
   await textDetector.close();
   scannedText = "";
   for(TextBlock block in recognizedText.blocks) {
     for (TextLine line in block.lines) {
       scannedText = scannedText + line.text + '\n';
     }
   }
   textScanning = false;
   setState(() {

   });
 }
  void getImage(String lan) async{
    try{
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      if(pickedImage != null)
      {
        textScanning = true;
        imageFile = pickedImage;
        getRecogonisedText(pickedImage);
        translator.translate(scannedText,to: lan ).then((output){
          setState(() {
             outputText = output.toString();
          });
        } );

      }
    }catch(e){
      textScanning = false;
      imageFile = null;
      setState(){};
      scannedText ="Error occured while scanning" ;

    }
  }
  void translate () {

  }
  String language = "ta";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0,100, 0, 0),
          child: Column(
            children: [
             Padding(
               padding: EdgeInsets.fromLTRB(60, 20, 50, 30),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text("English", style: TextStyle(
                     fontFamily: 'MontserratAlternates',
                     color: Colors.grey,
                     fontSize: 15,
                   ),),
                   Icon(Icons.compare_arrows_rounded),

                   DropdownButton(

                     // Initial Value
                     value: dropdownvalue,

                     // Down Arrow Icon
                     icon: const Icon(Icons.keyboard_arrow_down),

                     // Array list of items
                     items: items.map((String items) {
                       return DropdownMenuItem(
                         value: items,
                         child: Text(items),
                       );
                     }).toList(),
                     // After selecting the desired option,it will
                     // change button value to selected value
                     onChanged: (String? newValue) {
                       setState(() {
                         dropdownvalue = newValue!;
                         if(newValue == "Telugu"){
                           language = "te";
                         }
                         if(newValue == "Hindhi"){
                           language = "te";
                         }
                         if(newValue == "Malayalam"){
                           language = "ml";
                         }
                         if(newValue == "Kannada"){
                           language = "kn";
                         }

                       });
                     },
                   ),
                 ],
               ),
             ),
              if(textScanning )
                CircularProgressIndicator(),
              if(!textScanning && imageFile == null)
              Card(
                color: Color(0xff7ec7c0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                   child:
                   Icon(Icons.camera_alt_outlined,color: Colors.white,size: 40,),
                ),
              ),

              if(imageFile != null)
                Card(
                  color: Color(0xff7ec7c0),
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Center(
                      child: Image.file(File(imageFile!.path))
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 20, 30),
                child: Row(
                  children: [
                    Card(
                      color: Color(0xffFFB319),
                      child: InkWell(
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child:Center(
                            child: Text("Click hear", style: TextStyle(
                              fontFamily: 'MontserratAlternates',
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                          ),
                        ),
                        onTap: (){
                          getImage(language);
                          },
                      ),
                    ),
                    // Card(
                    //   color: Colors.grey,
                    //   child: InkWell(
                    //     child: SizedBox(
                    //       width: 125,
                    //       height: 50,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:EdgeInsets.fromLTRB(50, 0, 30, 0),
                child: Text(
                  outputText,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 60,
              ),
            ],
          )
        ),
      ),
    );
  }
}

