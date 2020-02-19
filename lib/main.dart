import 'package:flutkart/pages/offerZump.dart';
import 'package:flutter/material.dart';
import 'package:flutkart/pages/home_screen.dart';
import 'package:flutkart/pages/intro_screen.dart';
import 'package:flutkart/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/offerZump": (BuildContext context) => OfferZump(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.blue, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
