import 'package:bits/GetxController/BaleController.dart';
import 'package:flutter/material.dart';

import '../../GetxController/UserController.dart';
import '../../models/bale.dart';
import '../../models/login.dart';
import '../../utils/customappbar.dart';
import 'package:get/get.dart';

class UBINdetails extends StatefulWidget {
  const UBINdetails({super.key});

  @override
  State<UBINdetails> createState() => _UBINdetailsState();
}

class _UBINdetailsState extends State<UBINdetails> {
  // fetch value from GETX

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.getUser();

    String? name = user?.name ?? 'Not available';
    String selectedRole = userController.selectedRole.value;

    final BaleController baleController = Get.find();
    Bale bale = baleController.getBaleModel();
    print("LOT OFFFF DETAILSSS=====>");
    print(bale.lotDetails?.lotDetailsId);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'UBIN Details',
        name: name,
        selectedRole: selectedRole,
        showBackArrow: true,
      ),
    );
  }
}
