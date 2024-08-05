
import 'package:bits/models/login.dart';

class GeneralMethod {
  // Filter roles method 
  static List<Roles>? filterRoles(List<Roles>? roles) {
    return roles?.where((role) {
      return role.roleName == 'CI' || role.roleName == 'WI';
    }).toList();
  }
}
