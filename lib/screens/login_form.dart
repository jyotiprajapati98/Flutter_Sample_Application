import 'package:flutter/material.dart';
import 'new_Testing.dart';
import 'Register_Form.dart';


class LoginForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:_form(),
      ),
    );
  }
}

class _form extends StatefulWidget{
  _form({Key key}) : super(key : key);
  @override
  State<StatefulWidget> createState() => new _Form_Details();
}

class _Form_Details extends State<StatefulWidget>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Container(
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
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.redAccent, decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  //border: OutlineInputBorder(),
                  labelText: 'अपना नाम लिखें(Enter Your Name)',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '* नाम लिखें';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  //border: OutlineInputBorder(),
                  labelText: 'अपना पासवर्ड लिखें(Enter Your Password)',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '* पासवर्ड लिखें';
                  }
                  return null;
                },
              ),
              Container(
                  height: 80,
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    child: Text('Login'),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                        if(nameController.text=='admin'&& passwordController.text=='admin'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewTesting()),
                          );
                        }
                        else{
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Something is wrong"),
                                content: Text("Try Again Once..(पुनः प्रयास करें )"),
                              )
                          );
                        }
                      }
                    },
                  )),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 20,10, 0),
                child: Text('नया अकाउंट बनायें'),
              ),
              Container(
                  height: 80,
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    child: Text('Register / रजिस्टर '),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registration()),
                      );
                    },
                  )),
            ],

          ),
        ),
    );
  }

}