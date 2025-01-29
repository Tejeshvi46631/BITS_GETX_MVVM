import 'package:flutter/material.dart';

class MediaQueryUtil {
  static double getContainerWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8;
  }

  static double getIconSize(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double getFontSize(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double getSizedBox(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  // Home Screen Orientation
  static double getlogoSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.5;
  }

  static double containerheight(BuildContext contex) {
    return MediaQuery.of(contex).size.height * 0.2;
  }

  static double spaceheight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double fontsize(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  static double horizontalspacing(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.1;
  }

  static double gifsize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.2;
  }

  static double logoSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.5;
  }

static double screenHeightPadding(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }
}
