import 'dart:async';
import 'package:flutter/material.dart';
import 'login_form.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }

}

class StartState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration=Duration(seconds:4);
    return Timer(duration,route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder:(context)=>LoginForm(),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/blood.png',height: 250,width:250),
            Text('Susruta 1.0',style: TextStyle(
              fontSize:25.0,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              )
            ),
          ],
        ),
      ),
    );

  }
}
