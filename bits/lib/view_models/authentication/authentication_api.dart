import 'dart:convert';
import 'dart:io';
import 'package:bits/GetxController/statecontroller.dart';
import 'package:bits/data/app_exception.dart';
import 'package:bits/data/network/base_api_services.dart';
import 'package:bits/models/login.dart';
import 'package:bits/res/routes/routes_name.dart';
import 'package:bits/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../GetxController/UserController.dart';
import '../../GetxController/device_info_controller.dart';
import '../../utils/utils.dart';

class Authentication extends BaseAPIServices {
  @override
  Future<dynamic> fetchUrl() async {
    String url = Constant.authurl;

    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true;
      };

    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final responseJson = jsonDecode(responseBody);

        print("responseJson $responseJson");

        return responseJson['redirectionalUrl'];
      } else if (response.statusCode == 403) {
      } else {
        throw FetchdataException(
            'Error occurred with status code: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> dopost() async {
    final DeviceController deviceController = Get.find();
    final AppController appController = Get.find();
    String deviceID = deviceController.deviceID.value;
    String deviceName = deviceController.deviceName.value;
    double latitude = deviceController.latitude.value;
    double longitude = deviceController.longitude.value;
    String state = appController.state.value;
    String url = '${Constant.loginurl}'
        '?state=$state'
        '&deviceID=$deviceID'
        '&deviceName=$deviceName'
        '&latitude=$latitude'
        '&longitude=$longitude';
    print("URLL: $url");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final userController = Get.put(UserController());
        userController.updateUser(login.fromJson(responseBody));
        print('LoginObject here : $responseBody');
        print("TO TEST PURPOSE");
        final UserController userController1 = Get.find();

// Access token
        String? token = userController1.getToken();
        print('Token: $token');

// Access user data
        User? user = userController.getUser();

        print('User Name: ${user?.name}');
        print('User id: ${user?.roles?.first.roleName}');

        // Navigate as per user Roles

        if (user?.roles?.any((role) => role.roleName == 'Public') == true) {
          Get.toNamed(RouteName.homescreen);
           
        } else if (user?.roles?.any(
                (role) => role.roleName == 'CI' || role.roleName == 'WI') ==
            true) {
          Get.toNamed(RouteName.roleselection);
        }
      } else if (response.statusCode == 403) {
        throw FetchdataException('Access forbidden with status code: 403');
      } else if (response.statusCode == 500) {
        Utils.showCustomSnackbar(
            "Server Error", "Not able to get responce from server!!");
      } else {
        throw FetchdataException(
            'Error occurred with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw FetchdataException('Error occurred: $error');
    }
  }
}
