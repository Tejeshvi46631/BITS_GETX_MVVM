import 'package:get/get.dart';

class DeviceController extends GetxController {
  
  var deviceID = ''.obs;
  var deviceName = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var hostip = ''.obs;

   void updateDeviceID(String id) {
    deviceID.value = id;
  }

    void updateHostIP(String ip) {
    hostip.value = ip;
  }

  void updateDeviceName(String name) {
    deviceName.value = name;
  }

  void updateLatitude(double lat) {
    latitude.value = lat;
  }

  void updateLongitude(double lon) {
    longitude.value = lon;
  }
}
