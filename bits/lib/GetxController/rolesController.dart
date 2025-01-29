import 'package:bits/models/getWarehouse.dart';
import 'package:get/get.dart';

import '../models/getCenter.dart';
import '../view_models/Roleselection/getusersroledetails.dart';

// CONTROLLER FOR CENTER
class CenterController extends GetxController {
  var centerList = <getCenter>[].obs;

  // selected center
  var selectedCenter = ''.obs;

  void updateCenterData(List<getCenter> data) {
    centerList.value = data;
  }

  // call method to get center from API
  Future<void> getcenter() async {
    final getusersroledetails userRoleDetails = getusersroledetails();
    await userRoleDetails.getcenters();
  }

  List<String> get centerNames {
    return centerList
        .map((center) => center.centreId?.centreName ?? 'Unknown')
        .toList();
  }

  // get selected center
  void setSelectedCenter(String? center) {
    selectedCenter.value = center ?? '';
  }
 
  // get centerId
  int? getSelectedCenterId() {
    final selected = selectedCenter.value;
    if (selected.isEmpty) {
      return null;
    }
    final defaultCenter = getCenter();
    final center = centerList.firstWhere(
      (center) => center.centreId?.centreName == selected,
      orElse: () => defaultCenter,
    );
    return center.centreId?.centreId;
  }

  // void reset center
  void resetCenter() {
    selectedCenter.value = 'null';
  }
}

// CONTROLLER FOR WAREHOUSE

class WarehouseController extends GetxController {
  var warehouseList = <getWarehouse>[].obs;
  // get selected warehouse
  var selectedWarehouse = ''.obs;
  void updateWarehouseData(List<getWarehouse> data) {
    warehouseList.value = data;
  }

  // Call API For get list
  Future<void> getwarehouse() async {
    final getusersroledetails userRoleDetails = getusersroledetails();
    await userRoleDetails.getwarehouse();
  }

  List<String> get warehouseNames {
    return warehouseList
        .map((warehouse) => warehouse.warehouseId?.warehouseName ?? 'Unknown')
        .toList();
  }

  void setSelectedwarehouse(String? warehouse) {
    selectedWarehouse.value = warehouse ?? '';
  }

  int? getSelectedWarehouseId() {


    final selected = selectedWarehouse.value;
    if (selected.isEmpty) {
      return null;
    }

    final warehouse = warehouseList.firstWhere(
      (warehouse) => warehouse.warehouseId?.warehouseName == selected,
      orElse: () => getWarehouse.defaultWarehouse, // Return null if no element is found
    );

    return warehouse.warehouseId?.warehouseId;
  }

  void resetWarehouse() {
    selectedWarehouse.value = 'null';
  }
}
