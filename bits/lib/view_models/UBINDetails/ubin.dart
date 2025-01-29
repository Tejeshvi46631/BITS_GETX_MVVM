import 'dart:convert';

import 'package:bits/GetxController/UserController.dart';
import 'package:bits/models/bale.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../GetxController/BaleController.dart';
import '../../GetxController/countController.dart';
import '../../GetxController/rolesController.dart';
import '../../data/network/base_ubin_details.dart';
import '../../models/login.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/constant.dart';
import '../../utils/utils.dart';

class getUbindata extends BaseUbindetails {
  final UserController userController = Get.find();
  // check UBIN is Authorized or Not
  @override
  Future<void> checkUbinIsAuthorized(String ubin) async {
    String baseurl = '{$Constant.CheckAuthorized$ubin/}';
    print("CheckAuthorized API ==>> $baseurl");
    String? token = userController.getToken();
    print("TOKEN: $token");
    // get branchid
    User? user = userController.getUser();

    int? branchid = user!.postingBranchId!.branchId;
    print("BRANCH ID=====> $branchid");
    // get loginid
    int? loginid = user.loginId;
    print("LOGIN ID ====>> $loginid");
    // selected role
    String SelectedRole = userController.selectedRole.value;

    print("SelectedRole ===> $SelectedRole");

    // centerid warehouseid
    final WarehouseController warehousecontroller =
        Get.put(WarehouseController());
    final CenterController centercontroller = Get.put(CenterController());
    int? centerid = centercontroller.getSelectedCenterId();

    int? warehouseid = warehousecontroller.getSelectedWarehouseId() ?? null;

    try {
      
      String url =
          '$baseurl${branchid ?? 'null'}/${centerid ?? 'null'}/${null ?? 'null'}/${warehouseid ?? 'null'}/${SelectedRole ?? 'null'}/${loginid ?? 'null'}';

      print("CHECK AUTHORIZED URL ====>>> $url");

      final responce = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (responce.statusCode == 200) {
        final data = jsonDecode(responce.body);
        print("RESPONCE OF AUTHORIZED: $data");
        if (data == true) {
          getubindetails(ubin);
        } else if (data == false) {
          Utils.showCustomSnackbar(
              'Error', 'You are not authorized to view details ');
        }
      } else if (responce.statusCode == 401) {
        // handle Uanthorized user here
      }
    } catch (exception) {
      print("Exception $exception");
    }
  }

// get Bale Counts
  @override
  Future<void> getbalecount() async {
    final BaleController baleController = Get.find();
    Bale bale = baleController.getBaleModel();
    var lotNo = bale.lotDetails!.lotDetailsId;
    String url = '${Constant.BaleCount}$lotNo';
    print("URL GET COUNT ===>> $url");

    String? token = userController.getToken();

    print("Token  $token");
    // Get Bale details

    try {
      final responce = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (responce.statusCode == 200) {
        final data = jsonDecode(responce.body);

        // Assuming 'count' is a key in the JSON response
        int count = data['count'];

        // Access the GetX controller and update the count value
        final CountController countController = Get.put(CountController());

        countController.count.value = count; // Update the observable count

        print("Count: $count");
      } else if (responce.statusCode == 401) {
        UnauthorizedException();
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

// Get UBIN Details
  @override
  Future<void> getubindetails(String ubin) async {
    String url = '${Constant.LotStatus}$ubin';

    String? token = userController.getToken();
    print("Token: $token");
    print("URL getdetails : $url");
    print("QRValue of User tracking  : $ubin");
    try {
      final Response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (Response.statusCode == 200) {
        final responceBody = jsonDecode(Response.body);
        Map<String, dynamic> jsonMap = responceBody;
        Bale baleModel = Bale.fromJson(jsonMap);

// Access the GetX controller and save the model
        final BaleController baleController = Get.put(BaleController());
        baleController.setBaleModel(baleModel);

        Get.toNamed(RouteName.DetailScreen);
      }
    } catch (exception) {
      print("Exception occurred: $exception");
    }
  }

// Track last status  For Public user
  @override
  Future<void> trackingcheck(String qrInfo) async {
    String url = '${Constant.LotStatus}$qrInfo';

    String? token = userController.getToken();
    print("Token: $token");
    print("URL getdetails : $url");
    print("QRValue of User tracking  : $qrInfo");
    try {
      final Response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (Response.statusCode == 200) {
        final responceBody = jsonDecode(Response.body);
        print(responceBody['status']['status']);

        if (responceBody['status']['status'] == 'Sold') {
          Map<String, dynamic> jsonMap = responceBody;
          Bale baleModel = Bale.fromJson(jsonMap);

// Access the GetX controller and save the model
          final BaleController baleController = Get.put(BaleController());
          baleController.setBaleModel(baleModel);

          Get.toNamed(RouteName.DetailScreen);
        } else {
          Utils.showCustomSnackbar('Error', 'UBIN Status is Not Sold !!');
          Get.toNamed(RouteName.homescreen);
        }
      }
    } catch (exception) {
      print("Exception occurred: $exception");
    }
  }
}
