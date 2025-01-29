import 'package:bits/GetxController/rolesController.dart';
import 'package:bits/res/colors/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GetxController/UserController.dart';
import '../utils/MediaQueryUtil.dart';
import '../utils/customappbar.dart';
import '../view_models/Roleselection/getusersroledetails.dart';
import 'widget/dropdowndetails.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  final UserController userController =
      Get.put(UserController()); // Initialize UserController
  final WarehouseController warehousecontroller =
      Get.put(WarehouseController());
  final CenterController centercontroller = Get.put(CenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Role Screen', showBackArrow: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            SelectRoledropdown(),
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            Branchdetails(),
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            Obx(() {
              // Conditionally display dropdown based on selected role
              if (userController.selectedRole.value == 'CI') {
                return CenterDetailsDropdown();
              } else if (userController.selectedRole.value == 'WI') {
                return WarehouseDetailsDropdown();
              } else {
                return Container(); // Empty container for other cases
              }
            }),
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            SizedBox(height: MediaQueryUtil.getSizedBox(context)),
            Center(
              child: GestureDetector(
                onTap: () {
                  getusersroledetails getusersroles = getusersroledetails();
                  getusersroles.saveuserrole();
                  // Method for getting selected Role that value Store in sharedPrefrences
                },
                child: Container(
                  width: MediaQueryUtil.getContainerWidth(context) *
                      0.8, // Use the utility method to set the button width
                  height: MediaQueryUtil.getSizedBox(context) *
                      2.5, // Use the utility method to set the button height
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQueryUtil.getContainerWidth(context) *
                          0.1), // Margin based on container width
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQueryUtil.getSizedBox(context) *
                              2.5 /
                              2), // Border radius to make it rounded
                      color: AppColors.buttonColor),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQueryUtil.getFontSize(context) *
                            1.5, // Adjust font size
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
