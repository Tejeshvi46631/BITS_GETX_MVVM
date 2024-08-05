import 'package:bits/models/getWarehouse.dart';
import 'package:get/get.dart';

import '../models/getCenter.dart';

// CONTROLLER FOR CENTER
class CenterController extends GetxController {
  var centerList = <getCenter>[].obs;

  void updateCenterData(List<getCenter> data) {
    centerList.value = data;
  }

  List<getCenter> get getcenterList => centerList;
}

// CONTROLLER FOR WAREHOUSE

class WarehouseController extends GetxController {
  var warehouseList = <getWarehouse>[].obs;

  void updateWarehouseData(List<getWarehouse> data) {
    warehouseList.value = data;
  }

  List<getWarehouse> get getWarehouseList => warehouseList;
}
