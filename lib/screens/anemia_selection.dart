import 'package:flutter/material.dart';

class AnemiaSelection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _Selecter();

}
class _Selecter extends State<AnemiaSelection>{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       body: Center(
         child: Center(
           child: Text('Anemia Selection'),
         ),
       ),
     ),
   );
  }

}