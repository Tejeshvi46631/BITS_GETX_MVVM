import 'dart:io';
import 'package:bits/GetxController/device_info_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../GetxController/statecontroller.dart';
import 'package:device_info/device_info.dart';

class GetMethods {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  void extractAndStoreState(String url) {
    final AppController appController =
        Get.find(); // Access the existing instance of AppController
    final uri = Uri.parse(url);
    final state = uri.queryParameters['state'];
    if (state != null) {
      appController
          .updateState(state); // Update the observable state in the controller
    }
  }

  Future<void> deviceInfo() async {
    final DeviceController deviceController = Get.find();
    for (var interface in await NetworkInterface.list()) {
      for (var add in interface.addresses) {
        if (add.type == InternetAddressType.IPv4) {
          var hostip = add.address;
          // Storing HOSTIP address using GetX
          deviceController.updateHostIP(hostip);
        }
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    var _latitude = position.latitude;
    var _longitude = position.latitude;
    // Storing latitude value

    deviceController.updateLatitude(_latitude);

    // Storing longitude value

    deviceController.updateLongitude(_longitude);
    // UNCOMMENT if required location parameter need to send as parameter  in dopost request
    // List placemarks = await placemarkFromCoordinates(_latitude, _longitude);
    // var location = "${placemarks[0].locality}";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      var deviceName = androidDeviceInfo.model;
      // Storing device name value Android
      deviceController.updateDeviceName(deviceName);
      print('Device Name: $deviceName');
    } else if (Platform.isIOS) {
      var deviceName = (await DeviceInfoPlugin().iosInfo).name;
      // Update device Name IOS
      deviceController.updateDeviceName(deviceName);
      print('Device Name: $deviceName');
    }

    if (Platform.isAndroid) {
      var deviceInfo = await DeviceInfoPlugin().androidInfo;
      var deviceID = deviceInfo.androidId;
      // Storing Device ID ANDROID
      deviceController.updateDeviceID(deviceID);

      print('Device ID: $deviceID');
    } else if (Platform.isIOS) {
      var ID = await DeviceInfoPlugin().iosInfo;
      var deviceID = ID.identifierForVendor;
      // Storing Device ID IOS
      deviceController.updateDeviceID(deviceID);
      print('Device ID: $deviceID');
    }
  }
}
