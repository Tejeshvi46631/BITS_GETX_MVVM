import 'package:get/get.dart';

class AppController extends GetxController {
  var state = ''.obs; // Observable variable to store the state

  void updateState(String newState) {
    state.value = newState; // Update the observable value
  }

  String get stateValue => state.value; // Getter to access the state value
}
