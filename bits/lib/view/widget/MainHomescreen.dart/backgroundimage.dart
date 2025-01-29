
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/background.png'), // Replace with your image path
          fit: BoxFit.cover, // You can use other BoxFit values as well
        ),
      ),
    );
  }
}
