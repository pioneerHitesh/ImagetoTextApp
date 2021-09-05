

import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result='';
 File image =File("xyz");
 ImagePicker imagePicker =ImagePicker();
  pickImageFromGallery() async
  {
    XFile? pickedFile =await imagePicker.pickImage(source:ImageSource.gallery);
    if (pickedFile!= null)
    {
      image=File(pickedFile.path);
    setState(() {
      image;
      performImageLabeling();
    });
    }
  }
  captureImage() async
  {
      XFile? pickedFile =await imagePicker.pickImage(source:ImageSource.camera);
    if (pickedFile!= null)
    {
      image=File(pickedFile.path);
    setState(() {
      image;
      performImageLabeling();
    });
    }
  }
  performImageLabeling() async
  {
    final FirebaseVisionImage firebaseVisionImage =FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer =FirebaseVision.instance.textRecognizer();
    VisionText visionText =await recognizer.processImage(firebaseVisionImage);
    result="";
    setState(() {
      for (TextBlock block in visionText.blocks)
      {
        for(TextLine line in block.lines)
        {
          result+=line.text;
        }
        result+="\n";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/back.jpg'),
            fit:BoxFit.cover)
        ),
        child:Column(
          children: [
            SizedBox(width: 100),
            Container(
              height: 280,
              width:250,
              margin:EdgeInsets.only(top: 70),
              padding: EdgeInsets.only(left: 28,bottom: 5, right: 18),
              child: SingleChildScrollView(
                child: Padding(
                  padding:EdgeInsets.all(12.0),
                  child: SelectableText(result,
                  style: TextStyle(fontSize:16.0),
                  textAlign:TextAlign.justify,
                ),
                ),
              ),
                      decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/note.jpg'),
            fit:BoxFit.cover)
        ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,right: 140),
              child:Stack(
                children: <Widget>[
                  Stack(
                    children:<Widget>[
                        Center(
                          child:Image.asset('assets/pin.png',height: 240,width:240,),
                        )
                  ],
                  ),
                  Center(
                    child:TextButton(onPressed:() 
                    {
                        pickImageFromGallery();
                    },
                    onLongPress: ()
                    {
                      captureImage();
                    },
                    child:Container(
                      margin:EdgeInsets.only(top:25),
                      child:image.path != "xyz" ?Image.file(image,width: 140,height: 192,fit: BoxFit.fill) :Container(
                        width:240,
                        height: 200,
                        child:Icon(Icons.camera_front,size:100,color:Colors.grey,),
                      )

                    ),
                    ),
                  )
                ],
                ),
            )
          ],
        ),
      ),
      
    );
  }
}