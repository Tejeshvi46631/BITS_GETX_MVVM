class login {
  String? token;
  User? user;
  dynamic state;

  login({this.token, this.user, this.state});

  login.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    state =
        json['state']; // This can be dynamic, as it can be null or another type
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['state'] = this.state;
    return data;
  }
}

class User {
  int? loginId;
  String? name;
  String? status;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  int? pinCode;
  StateInfo? state;
  String? mobileNo;
  String? emailId;
  int? registerTimestamp;
  int? deregisterTimestamp;
  String? deregisterBy;
  String? userName;
  String? password;
  BranchInfo? postingBranchId;
  String? cciEmployeeId;
  UserCategoryId? userCategoryId;
  String? designation;
  int? statusUpdatedBy;
  int? statusUpdatedTimestamp;
  List<Roles>? roles;
  int? dob;
  String? gender;
  bool? isEnabled;

  User({
    this.loginId,
    this.name,
    this.status,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.pinCode,
    this.state,
    this.mobileNo,
    this.emailId,
    this.registerTimestamp,
    this.deregisterTimestamp,
    this.deregisterBy,
    this.userName,
    this.password,
    this.postingBranchId,
    this.cciEmployeeId,
    this.userCategoryId,
    this.designation,
    this.statusUpdatedBy,
    this.statusUpdatedTimestamp,
    this.roles,
    this.dob,
    this.gender,
    this.isEnabled,
  });

  User.fromJson(Map<String, dynamic> json) {
    loginId = json['loginId'];
    name = json['name'];
    status = json['status'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    addressLine3 = json['addressLine3'];
    pinCode = json['pinCode'];
    state = json['state'] != null ? StateInfo.fromJson(json['state']) : null;
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    registerTimestamp = json['registerTimestamp'];
    deregisterTimestamp = json['deregisterTimestamp'];
    deregisterBy = json['deregisterBy'];
    userName = json['userName'];
    password = json['password'];
    postingBranchId = json['postingBranchId'] != null
        ? BranchInfo.fromJson(json['postingBranchId'])
        : null;
    cciEmployeeId = json['cciEmployeeId'];
    userCategoryId = json['userCategoryId'] != null
        ? UserCategoryId.fromJson(json['userCategoryId'])
        : null;
    designation = json['designation'];
    statusUpdatedBy = json['statusUpdatedBy'];
    statusUpdatedTimestamp = json['statusUpdatedTimestamp'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    dob = json['dob'];
    gender = json['gender'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loginId'] = this.loginId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pinCode'] = this.pinCode;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    data['mobileNo'] = this.mobileNo;
    data['emailId'] = this.emailId;
    data['registerTimestamp'] = this.registerTimestamp;
    data['deregisterTimestamp'] = this.deregisterTimestamp;
    data['deregisterBy'] = this.deregisterBy;
    data['userName'] = this.userName;
    data['password'] = this.password;
    if (postingBranchId != null) {
      data['postingBranchId'] = postingBranchId!.toJson();
    }
    data['cciEmployeeId'] = this.cciEmployeeId;
    if (userCategoryId != null) {
      data['userCategoryId'] = userCategoryId!.toJson();
    }
    data['designation'] = this.designation;
    data['statusUpdatedBy'] = this.statusUpdatedBy;
    data['statusUpdatedTimestamp'] = this.statusUpdatedTimestamp;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['isEnabled'] = this.isEnabled;
    return data;
  }
}

class StateInfo {
  int? stateCode;
  String? stateName;
  String? updateBy;
  int? updateTs;

  StateInfo({
    this.stateCode,
    this.stateName,
    this.updateBy,
    this.updateTs,
  });

  StateInfo.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    stateName = json['stateName'];
    updateBy = json['updateBy'];
    updateTs = json['updateTs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stateCode'] = this.stateCode;
    data['stateName'] = this.stateName;
    data['updateBy'] = this.updateBy;
    data['updateTs'] = this.updateTs;
    return data;
  }
}

class BranchInfo {
  int? branchId;
  int? branchIdErp;
  String? branchCode;
  String? branchName;
  ZoneInfo? zoneId;
  String? branchNameHindi;

  BranchInfo({
    this.branchId,
    this.branchIdErp,
    this.branchCode,
    this.branchName,
    this.zoneId,
    this.branchNameHindi,
  });

  BranchInfo.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    branchIdErp = json['branchIdErp'];
    branchCode = json['branchCode'];
    branchName = json['branchName'];
    zoneId = json['zoneId'] != null ? ZoneInfo.fromJson(json['zoneId']) : null;
    branchNameHindi = json['branchNameHindi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branchId'] = this.branchId;
    data['branchIdErp'] = this.branchIdErp;
    data['branchCode'] = this.branchCode;
    data['branchName'] = this.branchName;
    if (zoneId != null) {
      data['zoneId'] = zoneId!.toJson();
    }
    data['branchNameHindi'] = this.branchNameHindi;
    return data;
  }
}

class ZoneInfo {
  int? zoneId;
  String? zoneName;

  ZoneInfo({
    this.zoneId,
    this.zoneName,
  });

  ZoneInfo.fromJson(Map<String, dynamic> json) {
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoneId'] = this.zoneId;
    data['zoneName'] = this.zoneName;
    return data;
  }
}

class UserCategoryId {
  int? categoryId;
  String? userCategory;

  UserCategoryId({this.categoryId, this.userCategory});

  UserCategoryId.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    userCategory = json['userCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = this.categoryId;
    data['userCategory'] = this.userCategory;
    return data;
  }
}

class Roles {
  int? roleId;
  String? roleName;
  String? description;
  String? displayName;
  String? epRoleName;

  Roles({
    this.roleId,
    this.roleName,
    this.description,
    this.displayName,
    this.epRoleName,
  });

  Roles.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    description = json['description'];
    displayName = json['displayName'];
    epRoleName = json['epRoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    data['description'] = this.description;
    data['displayName'] = this.displayName;
    data['epRoleName'] = this.epRoleName;
    return data;
  }
}
