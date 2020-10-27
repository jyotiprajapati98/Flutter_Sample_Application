// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'login_form.dart';


class AddRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _RegistrationForm(),
      ),
    );
  }
}

//variable for radio button
//calling form from here
class _RegistrationForm extends StatefulWidget {
  //key is use to identify the constructor uniquely
  _RegistrationForm({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _RegistrationDetails();
}

class _RegistrationDetails extends State<StatefulWidget> {

  // ignore: non_constant_identifier_names
  String leftButtonText = 'Take Left Eye Picture';
  String rightButtonText = 'Take Right Eye Picture';
  double textSize = 10.0;
  String albumName ='Eye Images';
  File leftimageURI;
  File rightimageURI;


  //taking key from globally
  final _formKey = GlobalKey<FormState>();
  //for radio buttons
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Male';

  // Group Value for Radio Button.
  int id = 1;
  //for date
  //int _chosenValue=1;
  DateTime selectedDate = DateTime.now();

  //PickedFile _image;
  //final picker = ImagePicker();

  /*Future getImage() async {
    final  pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {

        _image = PickedFile(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }*/
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
//drop down value
  String _dropDownValue;

  @override

  Widget build(BuildContext context) {

    TextEditingController name_Controller = TextEditingController();
    TextEditingController age_Controller = TextEditingController();
    TextEditingController occupation_Controller = TextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            /* Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Susruta',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily:'RobotoMono',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),*/
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Add New Record For Anemia Testing',
                style: TextStyle(
                    color: Colors.redAccent,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 50),
                    RaisedButton.icon(
                      icon: Icon(Icons.calendar_today_sharp,
                          color: Colors.redAccent),
                      onPressed: () => _selectDate(context),
                      label: Text(
                        'Test Date',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Unique Id',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* Unique Id';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: name_Controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Name/नाम लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* नाम लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: name_Controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Address/अपना पता लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '*अपना पता लिखें';
                }
                return null;
              },
            ),

            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: age_Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Age/उम्र लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* उम्र लिखें';
                }
                return null;
              },
            ),
            //Radio Buttons for Gender
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Gender'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Male';
                        id = 1;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Female';
                        id = 2;
                      });
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: 3,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Other';
                        id = 3;
                      });
                    },
                  ),
                  Text('other'),
                ],
              ),
            ),
            //drop down for the food
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: occupation_Controller,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.work,
                    color: Colors.red,
                  ), // icon is 48px widget.
                ),
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Occupation/व्‍यवसाय',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* व्‍यवसाय लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ), // icon is 48px widget.
                ),
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Mobile Number/मोबाइल नंबर लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* मोबाइल नंबर लिखें';
                }
                return null;
              },
            ),

            //food habits
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Food Type/ भोजन का प्रकार '),
                ],
              ),
            ),
            Container(
                child: DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('')
                      : Text(
                    _dropDownValue,
                    style: TextStyle(color: Colors.black),
                  ),
                  isExpanded: true,
                  iconSize: 20.0,
                  style: TextStyle(color: Colors.blue),
                  items: ['Veg/शाकाहारी', 'Non Veg/मांसाहारी', 'Both/दोनों'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDownValue = val;
                      },
                    );
                  },
                )
            ),
          /*  Stack(
              alignment: Alignment.center,
              children:<Widget> [
                _googlemap(context),
              ],
            ),*/
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Taking the Eye Picture....'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          leftimageURI == null
                              ? Icon(Icons.remove_red_eye_outlined,size: 50.0,)

                              : Image.file(leftimageURI, width: 120, height: 120, fit: BoxFit.cover),
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: Colors.blue,
                            onPressed: _leftEyePhoto,
                            child: Text(leftButtonText,
                                style:
                                TextStyle(fontSize: textSize, color: Colors.white)),
                          ),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          rightimageURI == null
                              ? Icon(Icons.remove_red_eye_outlined,size: 50.0,)

                              : Image.file(rightimageURI, width: 120, height: 120, fit: BoxFit.cover),
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: Colors.blue,
                            onPressed: _rightEyePhoto,
                            child: Text(rightButtonText,
                                style:
                                TextStyle(fontSize: textSize, color: Colors.white)),
                          ),
                        ]),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      label: Text('Submit'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Record added"),
                                ));
                      }),
                  SizedBox(width: 20),
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    label: Text('Cancel'),
                    onPressed: () {
                      //Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginForm()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _leftEyePhoto() async {
    // ignore: deprecated_member_use
    ImagePicker.pickImage(source: ImageSource.camera)
        .then((File recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        setState(() {

          leftimageURI = recordedImage;
          leftButtonText = 'Processing to save';
        });
        GallerySaver.saveImage(recordedImage.path, albumName: albumName)
            .then((bool success) {
          setState(() {

            leftimageURI = recordedImage;
            leftButtonText = 'Left Eye Image Saved';
          });
        });
      }
    });
  }
  void _rightEyePhoto() async {
    // ignore: deprecated_member_use
    ImagePicker.pickImage(source: ImageSource.camera)
        .then((File recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        setState(() {

          rightimageURI = recordedImage;
          rightButtonText = 'Processing to save';
        });
        GallerySaver.saveImage(recordedImage.path, albumName: albumName)
            .then((bool success) {
          setState(() {

            rightimageURI = recordedImage;
            rightButtonText = 'Right Eye Image Saved';
          });
        });
      }
    });
  }
}

/*
Widget _googlemap(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target: LatLng(21.2787, 81.8661),zoom: 12),
      onMapCreated: (GoogleMapController controller){
        var _controller;
        _controller.complete(controller);
      },

    ),
  );
}*/
