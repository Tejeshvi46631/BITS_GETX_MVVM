import 'dart:convert';

import 'package:bits/GetxController/UserController.dart';
import 'package:bits/GetxController/rolesController.dart';
import 'package:bits/data/app_exception.dart';
import 'package:bits/models/getCenter.dart';
import 'package:bits/models/getWarehouse.dart';
import 'package:bits/models/login.dart';
import 'package:bits/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/network/base_dropdown_service.dart';
import '../../utils/utils.dart';

class getusersroledetails extends Baseroleselection {
  final UserController userController = Get.find();
  // GET ASSIGNED USER CENTERD
  @override
  Future<void> getcenters() async {
    User? user = userController.getUser();
    int? loginid = user!.loginId;
    String? token = userController.getToken();

    print("Token: $token");
    print("LoginId from Getuserrole: $loginid");
    String url = '${Constant.listcenter}$loginid';
    print("URL For getCenter : $url");
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final responceBody = jsonDecode(response.body);
        print("Responce Body get assigned Center: $responceBody");

        // save value in controller
        final List<getCenter> centerList =
            responceBody.map((item) => getCenter.fromJson(item)).toList();

        // save value in controller
        final centerController = Get.put(CenterController());
        // here update value in controller 
        centerController.updateCenterData(centerList);
      } else if (response.statusCode == 500) {
        Utils.showCustomSnackbar(
            "Server Error", "Not able to get responce from server!!");
      } else {
        throw FetchdataException(
            'Error occured with status code :${response.statusCode}');
      }
    } on Exception catch (e) {
      throw ServerEror('Error occured: $e');
    }
  }

// GET ASSIGNE USER WAREHOUSE
  @override
  Future<void> getwarehouse() async {
    User? user = userController.getUser();
    int? loginid = user!.loginId;
    String? token = userController.getToken();

    print("Token: $token");
    print("LoginId from Getuserrole: $loginid");
    String url = '${Constant.listwarehouse}$loginid';
    print("URL For getCenter : $url");
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final responceBody = jsonDecode(response.body);
        print("Responce Body get assigned Center: $responceBody");
        // Save value in controller
        final List<getWarehouse> warehouseList =
            responceBody.map((item) => getWarehouse.fromJson(item)).toList();

        // Save value in controller
        final warehouseController = Get.put(WarehouseController());
        // update value in controller
        warehouseController.updateWarehouseData(warehouseList);
      } else if (response.statusCode == 500) {
        Utils.showCustomSnackbar(
            "Server Error", "Not able to get responce from server!!");
      } else {
        throw FetchdataException(
            'Error occured with status code :${response.statusCode}');
      }
    } on Exception catch (e) {
      throw ServerEror('Error occured: $e');
    }
  }

  // SAVE USER ENTERD ROLE
  @override
  Future<void> saveuserrole() {
    // TODO: implement saveuserrole
    throw UnimplementedError();
  }
}
