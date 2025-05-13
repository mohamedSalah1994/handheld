import 'package:flutter/material.dart';
import 'package:handheld/features/login/views/home_screen.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) =>  HomeScreen());



    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
      
  }
}
