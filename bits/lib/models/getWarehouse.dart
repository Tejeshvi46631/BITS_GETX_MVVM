class getWarehouse {
  int? userWarehouseMappingId;
  LoginId? loginId;
  WarehouseId? warehouseId;
  int? fromDate;
  int? toDate;

  getWarehouse(
      {this.userWarehouseMappingId,
      this.loginId,
      this.warehouseId,
      this.fromDate,
      this.toDate});

  getWarehouse.fromJson(Map<String, dynamic> json) {
    userWarehouseMappingId = json['userWarehouseMappingId'];
    loginId =
        json['loginId'] != null ? new LoginId.fromJson(json['loginId']) : null;
    warehouseId = json['warehouseId'] != null
        ? new WarehouseId.fromJson(json['warehouseId'])
        : null;
    fromDate = json['fromDate'];
    toDate = json['toDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userWarehouseMappingId'] = this.userWarehouseMappingId;
    if (this.loginId != null) {
      data['loginId'] = this.loginId!.toJson();
    }
    if (this.warehouseId != null) {
      data['warehouseId'] = this.warehouseId!.toJson();
    }
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    return data;
  }
}

class LoginId {
  int? loginId;
  String? name;
  String? status;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  int? pinCode;
  State? state;
  String? mobileNo;
  String? emailId;
  int? registerTimestamp;
  int? deregisterTimestamp;
  String? deregisterBy;
  String? userName;
  String? password;
  PostingBranchId? postingBranchId;
  String? cciEmployeeId;
  UserCategoryId? userCategoryId;
  String? designation;
  int? statusUpdatedBy;
  int? statusUpdatedTimestamp;
  List<Roles>? roles;
  int? dob;
  String? gender;
  bool? isEnabled;

  LoginId(
      {this.loginId,
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
      this.isEnabled});

  LoginId.fromJson(Map<String, dynamic> json) {
    loginId = json['loginId'];
    name = json['name'];
    status = json['status'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    addressLine3 = json['addressLine3'];
    pinCode = json['pinCode'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    registerTimestamp = json['registerTimestamp'];
    deregisterTimestamp = json['deregisterTimestamp'];
    deregisterBy = json['deregisterBy'];
    userName = json['userName'];
    password = json['password'];
    postingBranchId = json['postingBranchId'] != null
        ? new PostingBranchId.fromJson(json['postingBranchId'])
        : null;
    cciEmployeeId = json['cciEmployeeId'];
    userCategoryId = json['userCategoryId'] != null
        ? new UserCategoryId.fromJson(json['userCategoryId'])
        : null;
    designation = json['designation'];
    statusUpdatedBy = json['statusUpdatedBy'];
    statusUpdatedTimestamp = json['statusUpdatedTimestamp'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    dob = json['dob'];
    gender = json['gender'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginId'] = this.loginId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressLine3'] = this.addressLine3;
    data['pinCode'] = this.pinCode;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['mobileNo'] = this.mobileNo;
    data['emailId'] = this.emailId;
    data['registerTimestamp'] = this.registerTimestamp;
    data['deregisterTimestamp'] = this.deregisterTimestamp;
    data['deregisterBy'] = this.deregisterBy;
    data['userName'] = this.userName;
    data['password'] = this.password;
    if (this.postingBranchId != null) {
      data['postingBranchId'] = this.postingBranchId!.toJson();
    }
    data['cciEmployeeId'] = this.cciEmployeeId;
    if (this.userCategoryId != null) {
      data['userCategoryId'] = this.userCategoryId!.toJson();
    }
    data['designation'] = this.designation;
    data['statusUpdatedBy'] = this.statusUpdatedBy;
    data['statusUpdatedTimestamp'] = this.statusUpdatedTimestamp;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['isEnabled'] = this.isEnabled;
    return data;
  }
}

class State {
  int? stateCode;
  String? stateName;
  String? updateBy;
  int? updateTs;

  State({this.stateCode, this.stateName, this.updateBy, this.updateTs});

  State.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    stateName = json['stateName'];
    updateBy = json['updateBy'];
    updateTs = json['updateTs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateCode'] = this.stateCode;
    data['stateName'] = this.stateName;
    data['updateBy'] = this.updateBy;
    data['updateTs'] = this.updateTs;
    return data;
  }
}

class PostingBranchId {
  int? branchId;
  int? branchIdErp;
  String? branchCode;
  String? branchName;
  ZoneId? zoneId;
  String? branchNameHindi;

  PostingBranchId(
      {this.branchId,
      this.branchIdErp,
      this.branchCode,
      this.branchName,
      this.zoneId,
      this.branchNameHindi});

  PostingBranchId.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    branchIdErp = json['branchIdErp'];
    branchCode = json['branchCode'];
    branchName = json['branchName'];
    zoneId =
        json['zoneId'] != null ? new ZoneId.fromJson(json['zoneId']) : null;
    branchNameHindi = json['branchNameHindi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['branchIdErp'] = this.branchIdErp;
    data['branchCode'] = this.branchCode;
    data['branchName'] = this.branchName;
    if (this.zoneId != null) {
      data['zoneId'] = this.zoneId!.toJson();
    }
    data['branchNameHindi'] = this.branchNameHindi;
    return data;
  }
}

class ZoneId {
  int? zoneId;
  String? zoneName;

  ZoneId({this.zoneId, this.zoneName});

  ZoneId.fromJson(Map<String, dynamic> json) {
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  Roles(
      {this.roleId,
      this.roleName,
      this.description,
      this.displayName,
      this.epRoleName});

  Roles.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    description = json['description'];
    displayName = json['displayName'];
    epRoleName = json['epRoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    data['description'] = this.description;
    data['displayName'] = this.displayName;
    data['epRoleName'] = this.epRoleName;
    return data;
  }
}

class WarehouseId {
  int? warehouseId;
  String? warehouseName;
  PostingBranchId? branchId;
  String? warehouseAddress;
  double? latitude;
  double? longitude;
  List<int>? warehouseImage;
  bool? active;

  WarehouseId(
      {this.warehouseId,
      this.warehouseName,
      this.branchId,
      this.warehouseAddress,
      this.latitude,
      this.longitude,
      this.warehouseImage,
      this.active});

  WarehouseId.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    warehouseName = json['warehouseName'];
    branchId = json['branchId'] != null
        ? new PostingBranchId.fromJson(json['branchId'])
        : null;
    warehouseAddress = json['warehouseAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    warehouseImage = json['warehouseImage'].cast<int>();
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouseId'] = this.warehouseId;
    data['warehouseName'] = this.warehouseName;
    if (this.branchId != null) {
      data['branchId'] = this.branchId!.toJson();
    }
    data['warehouseAddress'] = this.warehouseAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['warehouseImage'] = this.warehouseImage;
    data['active'] = this.active;
    return data;
  }
}
