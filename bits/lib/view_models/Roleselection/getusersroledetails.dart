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

import '../../GetxController/statecontroller.dart';
import '../../data/network/base_dropdown_service.dart';
import '../../res/routes/routes_name.dart';
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
      final responceBody = jsonDecode(response.body);
      print("Responce Body get assigned Center: $responceBody");
      if (response.statusCode == 200) {
        final responceBody = jsonDecode(response.body);
        print("Responce Body get assigned Center: $responceBody");
        // create dyamic List
        final List<dynamic> dynamicList = responceBody;
        // convert List
        final List<Map<String, dynamic>> mapList =
            dynamicList.cast<Map<String, dynamic>>();

        // save value in controller
        final List<getCenter> centerList =
            mapList.map((item) => getCenter.fromJson(item)).toList();

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
        // Save value in controller list store in
        final List<dynamic> dynamicList = responceBody;

        final List<Map<String, dynamic>> mapList =
            dynamicList.cast<Map<String, dynamic>>();

        // Convert List<Map<String, dynamic>> to List<getWarehouse>
        final List<getWarehouse> warehouseList =
            mapList.map((item) => getWarehouse.fromJson(item)).toList();

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
  Future<void> saveuserrole() async {
    final UserController userController =
        Get.put(UserController()); // Initialize UserController
    final WarehouseController warehousecontroller =
        Get.put(WarehouseController());
    final CenterController centercontroller = Get.put(CenterController());
    User? user = userController.getUser();
    final AppController appController = Get.find();

    // get branch details
    int? branchid = user!.postingBranchId!.branchId;
// Login ID
    int? loginid = user.loginId;

    String? state = appController.state.value;
// get Token value
    String? token = userController.getToken();
    // get Selected Role
    String SelectedRole = userController.selectedRole.value;
// get center id
    int? centerid = centercontroller.getSelectedCenterId();
    // get warehouseid
    int? warehouseid = warehousecontroller.getSelectedWarehouseId() ?? null;

    String url = '${Constant.saveuserrole}';
    print("URL ---> SAVE SELECTED ROLE----->:: $url");
    // API call
    try {
      Map body = {
        "branchId": branchid,
        "centreId": centerid,
        "factoryId": "null",
        "labId": "null",
        "loginId": loginid,
        "selectedRole": SelectedRole,
        "state": state,
        "warehouseId": warehouseid,
      };
      print(body);
      final Response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (Response.statusCode == 200) {
        print("SUCESS--->>>");
        Get.toNamed(RouteName.homescreen);
      } else if (Response.statusCode == 500) {
        Utils.showCustomSnackbar(
            "Server Error", "Not able to get responce from server!!");
      } else {
        throw FetchdataException(
            'Error occured with status code :${Response.statusCode}');
      }
    } on Exception catch (e) {
      throw ServerEror('Error occured: $e');
    }
  }
}
