import 'dart:io';
import 'package:bits/GetxController/rolesController.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../GetxController/device_info_controller.dart';
import '../GetxController/statecontroller.dart';
import '../utils/getmethod.dart';

class MainViewModel {
  final AppController appController = Get.put(AppController());
  final DeviceController deviceController = Get.put(DeviceController());
  final WarehouseController wareehousecontroller =
      Get.put(WarehouseController());

  Future<void> initializeApp() async {
    await GetMethods().deviceInfo();
    await _initializeSecurityContext();
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future<void> _initializeSecurityContext() async {
    ByteData data = await PlatformAssetBundle()
        .load('assets/certificate/cotcorp-org-in.crt');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());
    HttpClient client = HttpClient(context: SecurityContext.defaultContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
}
