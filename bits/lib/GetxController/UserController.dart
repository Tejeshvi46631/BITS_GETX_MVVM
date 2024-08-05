import 'package:get/get.dart';
import '../models/login.dart';
import '../utils/genralmethod.dart';

class UserController extends GetxController {
  var Login = login().obs;

  void updateUser(login userData) {
    Login.value = userData;
  }

  String? getToken() {
    return Login.value.token;
  }

  User? getUser() {
    return Login.value.user;
  }
  List<Roles>? getFilteredRoles() {
    User? user = getUser();
    return GeneralMethod.filterRoles(user?.roles); // Use the class name to call the static method
  }
  
 
}
