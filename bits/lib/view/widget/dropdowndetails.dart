import 'package:bits/res/colors/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GetxController/UserController.dart';
import '../../GetxController/rolesController.dart';
import '../../models/login.dart';
import '../../utils/MediaQueryUtil.dart';

// select Role dropdown

class SelectRoledropdown extends StatefulWidget {
  @override
  _SelectRoledropdownState createState() => _SelectRoledropdownState();
}

class _SelectRoledropdownState extends State<SelectRoledropdown> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    // Retrieve the UserController instance
    final UserController userController = Get.find<UserController>();

    // Get filtered roles from the UserController
    List<Roles>? filteredRoles = userController.getFilteredRoles();
    print("Filtered Roles List: ");
    filteredRoles?.forEach((role) => print(role.displayName));

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DropdownButtonFormField<String>(
          value: _selectedRole,
          hint: const Text('Select Role'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
          items: filteredRoles?.map((role) {
            return DropdownMenuItem<String>(
              value: role.roleName, // Keep roleName as the value
              child: Text(role.displayName ?? 'Unknown'), // Display displayName
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              userController.setSelectedRole(newValue);
              _selectedRole = newValue;
            });
          },
        ),
      ),
    );
  }
}

// get Branch Name dropdown
class Branchdetails extends StatelessWidget {
  Branchdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the UserController instance
    final UserController userController1 = Get.find<UserController>();

    // Get the user from the UserController
    User? user = userController1.getUser();

    // Use MediaQueryUtil to get responsive sizes
    double containerWidth = MediaQueryUtil.getContainerWidth(context);

    double fontSize = MediaQueryUtil.getFontSize(context);

    // Check if the user data is available and build the UI accordingly
    return Center(
      child: user != null
          ? Container(
              width: containerWidth,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          user.postingBranchId?.branchName ?? 'N/A',
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ],
              ),
            )
          : Text(
              'No user data available',
              style: TextStyle(
                fontSize: fontSize * 0.6,
                color: Colors.red,
              ),
            ),
    );
  }
}

// get warehouse dropdown
class WarehouseDetailsDropdown extends StatefulWidget {
  @override
  _WarehouseDetailsDropdownState createState() =>
      _WarehouseDetailsDropdownState();
}

class _WarehouseDetailsDropdownState extends State<WarehouseDetailsDropdown> {
  String? _selectedWarehouse;
  //
  final WarehouseController warehouseController =
      Get.put(WarehouseController());
  final CenterController centerController = Get.put(CenterController());

  @override
  void initState() {
    super.initState();
    _loadWarehouseData();
  }

  Future<void> _loadWarehouseData() async {
    await warehouseController.getwarehouse();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField<String>(
            value: _selectedWarehouse,
            hint: const Text('Select Warehouse'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
            items: warehouseController.warehouseNames.map((name) {
              return DropdownMenuItem<String>(
                value: name,
                child: Text(name),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                warehouseController.setSelectedwarehouse(newValue);
                centerController.resetCenter();
              });
            },
          ),
        ),
      );
    });
  }
}

// get get Center dropdown
class CenterDetailsDropdown extends StatefulWidget {
  const CenterDetailsDropdown({super.key});

  @override
  State<CenterDetailsDropdown> createState() => _CenterDetailsDropdownState();
}

class _CenterDetailsDropdownState extends State<CenterDetailsDropdown> {
  String? _selectedCenter;

  final CenterController centerController = Get.put(CenterController());
  final WarehouseController warehouseController =
      Get.put(WarehouseController());
  @override
  void initState() {
    super.initState();
    _loadCenterData();
  }

  // call API from Controller

  Future<void> _loadCenterData() async {
    await centerController.getcenter();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButtonFormField<String>(
            value: _selectedCenter,
            hint: const Text('Select Center'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
            items: centerController.centerNames.map((name) {
              return DropdownMenuItem<String>(
                value: name,
                child: Text(name),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                centerController.setSelectedCenter(newValue);
                warehouseController.resetWarehouse();
              });
            },
          ),
        ),
      );
    });
  }
}
