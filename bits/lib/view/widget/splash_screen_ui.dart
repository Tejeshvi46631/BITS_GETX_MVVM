import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/routes/routes_name.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class AppTopImage extends StatelessWidget {
  const AppTopImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      left: 16.0,
      right: 16.0,
      top: screenHeight * 0.05,
      child: Image.asset(
        'assets/images/apptop.png',
        width: MediaQuery.of(context).size.width * 0.9,
        height: screenHeight * 0.1,
      ),
    );
  }
}

class CenterLogo extends StatelessWidget {
  const CenterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.30,
      left: (screenWidth - screenWidth * 0.5) / 2,
      child: Image.asset(
        'assets/images/centerlogo.png',
        width: screenWidth * 0.53,
        height: screenWidth * 0.6,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.62,
      left: 0,
      right: 0,
      child: const Center(
        child: Text(
          'Welcome to BITS',
          style: TextStyle(
            fontSize: 31.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.71,
      left: screenWidth * 0.04,
      right: screenWidth * 0.02,
      child: Stack(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: const Color(0xFF7575E3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
            ),
            onPressed: () {
              Get.toNamed(RouteName.WebViewPage);
            },
            child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.06,
                alignment: Alignment.center,
                child: Text(
                  'Sign In via e-Pramaan',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Positioned(
            left: screenWidth * 0.06,
            top: 6.0,
            child: Image.asset(
              'assets/images/eP_logo2.png',
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

class CenterBlockchainLogo extends StatelessWidget {
  const CenterBlockchainLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.1;
    double aspectRatio = 28.0 / 29.95;
    double imageHeight = imageWidth / aspectRatio;

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.84,
      left: (screenWidth - imageWidth) / 2.0,
      child: Image.asset(
        'assets/images/centerblockchain.png',
        width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}

class PoweredByText extends StatelessWidget {
  const PoweredByText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.90,
      left: screenWidth * 0.10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Powered by',
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.white,
            ),
          ),
          Text(
            'CCI BITS BLOCK CHAIN NETWORK',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          InkWell(
            onTap: () {
              var link = "https://cdac.in/";
              launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
            },
            child: Text(
              'Developed and maintained by C-DAC',
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
