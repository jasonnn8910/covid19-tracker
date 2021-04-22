import 'package:covid19_tracker/screens/profile.dart';
import 'package:flutter/material.dart';
import 'router_constant.dart';
import 'package:covid19_tracker/screens/screen.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case signUpScreen:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case profileScreen:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}