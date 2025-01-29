import 'package:get/get.dart';
import '../models/login.dart';
import '../utils/genralmethod.dart';

class UserController extends GetxController {
  var Login = login().obs;
  // List of roles
  var roles = <Roles>[].obs;

  // Selected role
  var selectedRole = ''.obs; // Assuming initial empty value

  void updateUser(login userData) {
    Login.value = userData;
  }

  String? getToken() {
    return Login.value.token;
  }

  User? getUser() {
    return Login.value.user;
  }

  // List for filter roles
  List<Roles>? getFilteredRoles() {
    User? user = getUser();
    return GeneralMethod.filterRoles(
        user?.roles); // Use the class name to call the static method
  }

  // Method to set selected role
  void setSelectedRole(String? role) {
    selectedRole.value = role ?? '';
  }
}
