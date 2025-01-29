import 'package:flutter/material.dart';

class CenterLogo extends StatelessWidget {
  final double logoSize;

  CenterLogo({required this.logoSize});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/centerlogo.png', // Replace with your logo image path
      width: logoSize,
      height: logoSize,
    );
  }
}