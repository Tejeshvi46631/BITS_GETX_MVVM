import 'package:bits/models/login.dart';

import '../data/app_exception.dart';

class GeneralMethod {
  // Filter roles method
  static List<Roles>? filterRoles(List<Roles>? roles) {
    return roles?.where((role) {
      return role.roleName == 'CI' || role.roleName == 'WI';
    }).toList();
  }

  // Check UBIN Validation

  // convert UBIN character to LOWER TO UPPER
  static String convertToUpperCase(String input) {
    return input.toUpperCase();
  }

  // check Character 16digit or NOT

  // Containd URL

  static itsurl() {
    InvalidUrlException();
  }
}
