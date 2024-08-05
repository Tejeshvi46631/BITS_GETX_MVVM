class Constant {
  // using Production URL here
  // Stagining URL
  static const String baseUrl = 'https://bits.cotcorp.org.in/cci-bits/';
  // LOAD WEB VIEW
  static const String authurl = '${baseUrl}authenticate/true';
  // GET USER DETAILS
  static const String loginurl = '${baseUrl}getLoggedInUser';
  // GET LIST OF WAREHOUSE
  static const String listwarehouse =
      '${baseUrl}bits/user/management/getAssignedWarehouses/';
  // GET LIST OF CENTERNAME
  static const String listcenter =
      '${baseUrl}bits/user/management/getAssignedCentres/';
  // SAVE USER ROLE
  static const String saveuserrole = '${baseUrl}bits/userPostingInfo/save';
}
