import 'package:bits/GetxController/UserController.dart';
import 'package:bits/utils/genralmethod.dart';
import 'package:bits/utils/utils.dart';
import 'package:bits/view_models/UBINDetails/ubin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:get/get.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String? qrInfo = '';
  bool camState = true;
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    selectedRole = userController.selectedRole.value;
    print("USERROLES:  $selectedRole");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'QR Code Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 117, 228),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => camState = !camState),
        child: Icon(camState ? Icons.camera_rounded : Icons.camera),
      ),
      body: camState ? buildCamera() : buildScanResult(),
    );
  }

  Widget buildCamera() {
    return Center(
      child: SizedBox(
        height: 1000,
        width: 500,
        child: QRBarScannerCamera(
          onError: (context, error) => Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          qrCodeCallback: qrCallback,
        ),
      ),
    );
  }

  Widget buildScanResult() {
    return Center(
      child: GestureDetector(
        onTap: () async {
          // Handle the tap event here, if needed
        },
        child: Text(
          "UBIN: $qrInfo",
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  void qrCallback(String? code) {
    if (code == null || code.length != 16) {
      // Show error alert when the code is null or less than 16 digits
      Utils.showErrorAlertyellow(
          context, "Scanner value is less than 16 digits or null");
    } else {
      setState(() {
        camState = false;
        qrInfo = GeneralMethod.convertToUpperCase(code);

        if (isURL(qrInfo!)) {
          GeneralMethod.itsurl();
        } else if (selectedRole == 'public') {
          // Check UBIN value is 16 digits
          // Convert UBIN to upper case
          // If selected role is public, call the tracking() method
          // If selected role is CI/WI, call the CheckAuthorized method
          GeneralMethod.convertToUpperCase(qrInfo!);
          getUbindata ubindata = getUbindata();
          ubindata.trackingcheck(qrInfo!);
        } else if (selectedRole == 'CI' || selectedRole == 'WI') {
          print("QRINFO:: $qrInfo");
          GeneralMethod.convertToUpperCase(qrInfo!);
          getUbindata ubindata = getUbindata();
          ubindata.trackingcheck(qrInfo!);
          // Add your logic here for CI or WI roles
        }
      });
    }
  }

  bool isURL(String code) {
    return code.startsWith('http://') || code.startsWith('https://');
  }
}
