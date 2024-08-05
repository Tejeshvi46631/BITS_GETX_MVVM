import 'package:bits/view/widget/splash_screen_ui.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          AppTopImage(),
          CenterLogo(),
          WelcomeText(),
          SignInButton(),
          CenterBlockchainLogo(),
          PoweredByText(),
        ],
      ),
    );
  }
}
