import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> navigationKey;
  static NavigationService instance = NavigationService();

  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String route){
    return navigationKey.currentState.pushReplacementNamed(route);
  }
  Future<dynamic> navigateTo(String route){
    return navigationKey.currentState.pushNamed(route);
  }
  Future<dynamic> navigatePopandPush(String route){
    return navigationKey.currentState.popAndPushNamed(route);
  }
  Future<dynamic> navigateToRoute(MaterialPageRoute route){
    return navigationKey.currentState.push(route);
  }

  goBack(){
    return navigationKey.currentState.pop();
  }
}