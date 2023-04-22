import 'dart:io';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class translation extends StatefulWidget {
  const translation({Key? key}) : super(key: key);
  @override
  State<translation> createState() => _translationState();
}

class _translationState extends State<translation> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
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
          if(textScanning)
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
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffFFB319),
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: (){
            getImage(language);
            }, child: Text("Click Me")),
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
            height: 60,
          ),
        ]
    );
  }
}

