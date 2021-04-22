import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Home Page'),),
        body: Container(
      color: Colors.green,
          child: Row(
            children: [
              TextButton(onPressed: (){

              }, child: Text('SIGN OUT'))
            ],
          )
    ));
  }
}
