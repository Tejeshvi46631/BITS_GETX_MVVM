import 'package:bits/utils/MediaQueryUtil.dart';
import 'package:bits/view/widget/MainHomescreen.dart/backgroundimage.dart';
import 'package:bits/view/widget/MainHomescreen.dart/centerlogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GetxController/UserController.dart';
import '../models/login.dart';
import '../res/routes/routes_name.dart';
import '../utils/customappbar.dart';
import 'widget/MainHomescreen.dart/EnteryScan.dart';
import 'widget/MainHomescreen.dart/showEnterUBINDialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.getUser();

    String? name = user?.name ?? 'Not available';
    String selectedRole = userController.selectedRole.value;

    return Scaffold(
      appBar: CustomAppBar(
          title: 'Welcome!!',
          showBackArrow: true,
          name: name,
          selectedRole: selectedRole),
      body: Stack(
        children: [
          BackgroundImage(),
          Positioned(
            top: MediaQueryUtil.screenHeightPadding(
                context), // Adjust the top position as needed
            left: MediaQueryUtil.horizontalspacing(context),
            right: MediaQueryUtil.horizontalspacing(context),
            child: CenterLogo(logoSize: MediaQueryUtil.logoSize(context)),
          ),
          Positioned(
            top: MediaQueryUtil.screenHeightPadding(context) +
                MediaQueryUtil.logoSize(context) +
                MediaQueryUtil.spaceheight(
                    context), // Position below the logo with space
            left: MediaQueryUtil.horizontalspacing(context),
            right: MediaQueryUtil.horizontalspacing(context),
            child: Column(
              children: [
                EntryOption(
                  containerHeight: MediaQueryUtil.containerheight(context),
                  gifPath: 'assets/images/enter.gif',
                  label: 'Enter UBIN',
                  fontSize: MediaQueryUtil.fontsize(context),
                  buttonText: 'Tap to enter UBIN',
                  gifSize: MediaQueryUtil.gifsize(context),
                  onTap: () {
                    showEnterUBINDialog(context, (String ubin) {
                      // Handle the entered UBIN value here
                      print('Entered UBIN: $ubin');
                    });
                  },
                ),
                SizedBox(height: MediaQueryUtil.spaceheight(context)),
                Text(
                  '----------- OR -----------',
                  style: TextStyle(
                    fontSize: MediaQueryUtil.fontsize(context),
                    color: Colors.white, // Adjust the color as needed
                  ),
                ),
                SizedBox(height: MediaQueryUtil.spaceheight(context)),
                EntryOption(
                  containerHeight: MediaQueryUtil.containerheight(context),
                  gifPath: 'assets/images/Scanner.gif',
                  label: 'Scan QR Code',
                  fontSize: MediaQueryUtil.fontsize(context),
                  buttonText: 'Tap to Scan',
                  gifSize: MediaQueryUtil.gifsize(context),
                  onTap: () {
                    Get.toNamed(RouteName.scanner);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
