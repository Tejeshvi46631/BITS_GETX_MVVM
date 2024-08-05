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
}
