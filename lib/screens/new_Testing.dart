import 'package:flutter/rendering.dart';

import 'add_Record.dart';
import 'package:flutter/material.dart';

class NewTesting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:_OptionScreen(),
      ),
    );
  }
}

class _OptionScreen extends StatefulWidget{
  _OptionScreen({Key key}) : super(key : key);
  @override
  State<StatefulWidget> createState() => new _Options();
}

class _Options extends State<StatefulWidget>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:30,left: 50),
              child:RaisedButton.icon (
                icon: Icon(Icons.post_add_sharp, color:Colors.white,size: 40.0),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                textColor: Colors.white,
                color: Colors.redAccent,
                label: Text('Add New Record'),
                onPressed:(){
                  //Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddRecord()),
                  );
                },
              ),

            ),
            Container(
              padding: EdgeInsets.only(top:30,left: 50),
              child:RaisedButton.icon (
                icon: Icon(Icons.list_alt, color:Colors.white,size: 40.0,),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                textColor: Colors.white,
                color: Colors.redAccent,
                label: Text('View All Record'),
                onPressed:(){
                  //Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>NewTesting()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:30,left: 50),
              child:RaisedButton.icon (
                icon: Icon(Icons.update, color:Colors.white,size: 40.0),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                textColor: Colors.white,
                color: Colors.redAccent,
                label: Text('Update  Record'),
                onPressed:(){
                  //Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewTesting()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:30,left: 50),
              child:RaisedButton.icon (
                icon: Icon(Icons.delete_forever, color:Colors.white,size: 40,),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                textColor: Colors.white,
                color: Colors.redAccent,
                label: Text('Delete   Record'),
                onPressed:(){
                  //Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>NewTesting()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:20,left: 50),
              child:RaisedButton.icon (
                icon: Icon(Icons.food_bank_outlined, color:Colors.white,size: 40,),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                textColor: Colors.white,
                color: Colors.redAccent,
                label: Text('Food & Nutrition'),
                onPressed:(){
                  //Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>NewTesting()),
                  );
                },
              ),
            ),


          ],
        ),
      ),
      );
  }
}