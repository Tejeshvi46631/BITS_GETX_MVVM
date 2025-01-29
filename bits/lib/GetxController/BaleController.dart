import 'package:bits/models/bale.dart';
import 'package:get/get.dart';

class BaleController extends GetxController {
  var baleModel =Bale().obs;

  void setBaleModel(Bale model) {
    baleModel.value = model;
  }

  Bale getBaleModel() {
    return baleModel.value;
  }
}
