import 'package:ofertasZump/pages/home_initial.dart';
import 'package:ofertasZump/pages/offerZump.dart';
import 'package:flutter/material.dart';
import 'package:ofertasZump/pages/home_screen.dart';
import 'package:ofertasZump/pages/intro_screen.dart';
import 'package:ofertasZump/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/homeInitial": (BuildContext context) => HomeInitial(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/offerZump": (BuildContext context) => OfferZump(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.blue, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
