import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


 class UserScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _Camera();
 }

class _Camera extends State<UserScreen>{
  File _image;
  Future getImage() async{
    var image= await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new Scaffold(
        body: new Center(child: _image == null ? new Text('Not Taking Any Picture'):new Image.file(_image),
        ),
        floatingActionButton: new FloatingActionButton(onPressed: getImage,
          tooltip: 'Pick Images',
          child: new Icon(Icons.camera),
        ),

      ),
    );
  }

}