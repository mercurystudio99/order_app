import 'package:flutter/material.dart';

class NavigationRouter {
  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void switchToStart(BuildContext context) {
    Navigator.pushNamed(context, "/StartScreen");
  }

  static void switchToView(BuildContext context) {
    Navigator.pushNamed(context, "/ViewScreen");
  }
}
