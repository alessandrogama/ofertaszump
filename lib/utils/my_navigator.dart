import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }

  static void goToOffers(BuildContext context) {
    Navigator.pushNamed(context, "/offerZump");
  }
  static void goToHomeInitial(BuildContext context) {
    Navigator.pushNamed(context, "/homeInitial");
  }
}
