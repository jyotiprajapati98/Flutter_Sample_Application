import 'package:anemia_detector/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'anemia_selection.dart';

class Registration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:_RegistrationForm(),
      ),
    );
  }
}

//variable for radio button
//calling form from here
class _RegistrationForm extends StatefulWidget{
  //key is use to identify the constructor uniquely
  _RegistrationForm({Key key}) : super(key : key);
  @override
  State<StatefulWidget> createState() =>new _RegistrationDetails();
}

//content of the form is here

class _RegistrationDetails extends State<StatefulWidget>{
  //taking key from globally
  final _formKey = GlobalKey<FormState>();
  //for radio buttons
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Male';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    TextEditingController userName_Controller = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
              padding: EdgeInsets.only(top:30,left: 20),

              child: Text(
                'Registration',
                style: TextStyle(
                    color: Colors.redAccent, decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            TextFormField(
              style: TextStyle(
                  fontSize: 15.0,
              ),
              controller: userName_Controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Name/अपना नाम लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* नाम लिखें';
                }
                return null;
              },
            ),
            //Radio Buttons for Gender
            Container(
              padding: EdgeInsets.all(0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Gender/लिंग:'),
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
                  SizedBox(width: 20),
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
                  Text('Female',),

                ],
              ),
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: userName_Controller,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.red,
                  ), // icon is 48px widget.
                ),
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Email/अपना email लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* email लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: userName_Controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'User Name/अपना username लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* username लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Password/अपना पासवर्ड लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* पासवर्ड लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              textAlign: TextAlign.left,
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                //border: OutlineInputBorder(),
                labelText: 'Reenter Password/फिर से पासवर्ड लिखें',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '* पासवर्ड लिखें';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 15.0,
              ),
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
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
            Container(
              padding: EdgeInsets.all(30),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      icon: Icon(Icons.send, color:Colors.white,),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      label: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // Process data.
                        if (userName_Controller.text == 'admin' &&
                            passwordController.text == 'admin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginForm()),
                          );
                        }
                      }
                    }
                  ),
                  SizedBox(width: 20),
                  RaisedButton.icon(
                    icon: Icon(Icons.cancel, color:Colors.white,),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    label: Text('Cancel'),
                    onPressed:(){
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
}