class Bale {
  int? baleId;
  UbinMst? ubinMst;
  LotDetails? lotDetails;
  int? baleNo;
  double? moisture;
  String? micronaireValue;
  String? stappleLength; // Changed Null to String?
  bool? isSampled; // Changed Null to bool?
  int? balePressDate;
  double? balePressWeight;
  String? supportingDocument; // Changed Null to String?
  Status? status;
  GeneratedBy? statusUpdatedBy;
  int? statusUpdatedTimestamp;
  GeneratedBy? sampleSubmittedBy; // Changed Null to GeneratedBy?
  int? sampleTimestamp; // Changed Null to int?
  String? remarks; // Changed Null to String?
  String? userRole;

  Bale(
      {this.baleId,
      this.ubinMst,
      this.lotDetails,
      this.baleNo,
      this.moisture,
      this.micronaireValue,
      this.stappleLength,
      this.isSampled,
      this.balePressDate,
      this.balePressWeight,
      this.supportingDocument,
      this.status,
      this.statusUpdatedBy,
      this.statusUpdatedTimestamp,
      this.sampleSubmittedBy,
      this.sampleTimestamp,
      this.remarks,
      this.userRole});

  Bale.fromJson(Map<String, dynamic> json) {
    baleId = json['baleId'];
    ubinMst =
        json['ubinMst'] != null ? UbinMst.fromJson(json['ubinMst']) : null;
    lotDetails = json['lotDetails'] != null
        ? LotDetails.fromJson(json['lotDetails'])
        : null;
    baleNo = json['baleNo'];
    moisture = json['moisture'];
    micronaireValue = json['micronaireValue'];
    stappleLength = json['stappleLength'];
    isSampled = json['isSampled'];
    balePressDate = json['balePressDate'];
    balePressWeight = json['balePressWeight'];
    supportingDocument = json['supportingDocument'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    statusUpdatedBy = json['statusUpdatedBy'] != null
        ? GeneratedBy.fromJson(json['statusUpdatedBy'])
        : null;
    statusUpdatedTimestamp = json['statusUpdatedTimestamp'];
    sampleSubmittedBy = json['sampleSubmittedBy'] != null
        ? GeneratedBy.fromJson(json['sampleSubmittedBy'])
        : null;
    sampleTimestamp = json['sampleTimestamp'];
    remarks = json['remarks'];
    userRole = json['userRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['baleId'] = baleId;
    if (ubinMst != null) {
      data['ubinMst'] = ubinMst!.toJson();
    }
    if (lotDetails != null) {
      data['lotDetails'] = lotDetails!.toJson();
    }
    data['baleNo'] = baleNo;
    data['moisture'] = moisture;
    data['micronaireValue'] = micronaireValue;
    data['stappleLength'] = stappleLength;
    data['isSampled'] = isSampled;
    data['balePressDate'] = balePressDate;
    data['balePressWeight'] = balePressWeight;
    data['supportingDocument'] = supportingDocument;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (statusUpdatedBy != null) {
      data['statusUpdatedBy'] = statusUpdatedBy!.toJson();
    }
    data['statusUpdatedTimestamp'] = statusUpdatedTimestamp;
    if (sampleSubmittedBy != null) {
      data['sampleSubmittedBy'] = sampleSubmittedBy!.toJson();
    }
    data['sampleTimestamp'] = sampleTimestamp;
    data['remarks'] = remarks;
    data['userRole'] = userRole;
    return data;
  }
}

class UbinMst {
  String? ubin;
  int? generatingBranchId;
  GeneratedBy? generatedBy;
  Null generatedTimestamp;
  Null status;
  int? generatedForBranchId;

  UbinMst(
      {this.ubin,
      this.generatingBranchId,
      this.generatedBy,
      this.generatedTimestamp,
      this.status,
      this.generatedForBranchId});

  UbinMst.fromJson(Map<String, dynamic> json) {
    ubin = json['ubin'];
    generatingBranchId = json['generatingBranchId'];
    generatedBy = json['generatedBy'] != null
        ? new GeneratedBy.fromJson(json['generatedBy'])
        : null;
    generatedTimestamp = json['generatedTimestamp'];
    status = json['status'];
    generatedForBranchId = json['generatedForBranchId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ubin'] = this.ubin;
    data['generatingBranchId'] = this.generatingBranchId;
    if (this.generatedBy != null) {
      data['generatedBy'] = this.generatedBy!.toJson();
    }
    data['generatedTimestamp'] = this.generatedTimestamp;
    data['status'] = this.status;
    data['generatedForBranchId'] = this.generatedForBranchId;
    return data;
  }
}

class GeneratedBy {
  int? loginId;
  String? name;

  GeneratedBy({this.loginId, this.name});

  GeneratedBy.fromJson(Map<String, dynamic> json) {
    loginId = json['loginId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginId'] = this.loginId;
    data['name'] = this.name;
    return data;
  }
}

class LotDetails {
  int? lotDetailsId;
  String? buyerName;
  String? buyerNo;
  CentreId? centreId;
  String? cropYear;
  FactoryId? factoryId;
  int? heapDate;
  int? lotPressDate;
  int? heapNo;
  int? lotNo;
  String? operationType;
  String? pressMachineNo;
  String? pressMarkNo;
  int? pressRunningFrom;
  int? pressRunningTo;
  int? soldDate;
  VarietyId? varietyId;
  double? lotWeight;
  int? lotUpdatedBy;
  int? lotUpdatedTimestamp;

  LotDetails(
      {this.lotDetailsId,
      this.buyerName,
      this.buyerNo,
      this.centreId,
      this.cropYear,
      this.factoryId,
      this.heapDate,
      this.lotPressDate,
      this.heapNo,
      this.lotNo,
      this.operationType,
      this.pressMachineNo,
      this.pressMarkNo,
      this.pressRunningFrom,
      this.pressRunningTo,
      this.soldDate,
      this.varietyId,
      this.lotWeight,
      this.lotUpdatedBy,
      this.lotUpdatedTimestamp});

  LotDetails.fromJson(Map<String, dynamic> json) {
    lotDetailsId = json['lotDetailsId'];
    buyerName = json['buyerName'];
    buyerNo = json['buyerNo'];
    centreId = json['centreId'] != null
        ? new CentreId.fromJson(json['centreId'])
        : null;
    cropYear = json['cropYear'];
    factoryId = json['factoryId'] != null
        ? new FactoryId.fromJson(json['factoryId'])
        : null;
    heapDate = json['heapDate'];
    lotPressDate = json['lotPressDate'];
    heapNo = json['heapNo'];
    lotNo = json['lotNo'];
    operationType = json['operationType'];
    pressMachineNo = json['pressMachineNo'];
    pressMarkNo = json['pressMarkNo'];
    pressRunningFrom = json['pressRunningFrom'];
    pressRunningTo = json['pressRunningTo'];
    soldDate = json['soldDate'];
    varietyId = json['varietyId'] != null
        ? new VarietyId.fromJson(json['varietyId'])
        : null;
    lotWeight = json['lotWeight'];
    lotUpdatedBy = json['lotUpdatedBy'];
    lotUpdatedTimestamp = json['lotUpdatedTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lotDetailsId'] = this.lotDetailsId;
    data['buyerName'] = this.buyerName;
    data['buyerNo'] = this.buyerNo;
    if (this.centreId != null) {
      data['centreId'] = this.centreId!.toJson();
    }
    data['cropYear'] = this.cropYear;
    if (this.factoryId != null) {
      data['factoryId'] = this.factoryId!.toJson();
    }
    data['heapDate'] = this.heapDate;
    data['lotPressDate'] = this.lotPressDate;
    data['heapNo'] = this.heapNo;
    data['lotNo'] = this.lotNo;
    data['operationType'] = this.operationType;
    data['pressMachineNo'] = this.pressMachineNo;
    data['pressMarkNo'] = this.pressMarkNo;
    data['pressRunningFrom'] = this.pressRunningFrom;
    data['pressRunningTo'] = this.pressRunningTo;
    data['soldDate'] = this.soldDate;
    if (this.varietyId != null) {
      data['varietyId'] = this.varietyId!.toJson();
    }
    data['lotWeight'] = this.lotWeight;
    data['lotUpdatedBy'] = this.lotUpdatedBy;
    data['lotUpdatedTimestamp'] = this.lotUpdatedTimestamp;
    return data;
  }
}

class CentreId {
  int? centreId;
  BranchId? branchId;
  String? centreCode;
  String? centreName;
  bool? active;

  CentreId(
      {this.centreId,
      this.branchId,
      this.centreCode,
      this.centreName,
      this.active});

  CentreId.fromJson(Map<String, dynamic> json) {
    centreId = json['centreId'];
    branchId = json['branchId'] != null
        ? new BranchId.fromJson(json['branchId'])
        : null;
    centreCode = json['centreCode'];
    centreName = json['centreName'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['centreId'] = this.centreId;
    if (this.branchId != null) {
      data['branchId'] = this.branchId!.toJson();
    }
    data['centreCode'] = this.centreCode;
    data['centreName'] = this.centreName;
    data['active'] = this.active;
    return data;
  }
}

class BranchId {
  int? branchId;
  int? branchIdErp;
  String? branchCode;
  String? branchName;
  ZoneId? zoneId;
  String? branchNameHindi;

  BranchId(
      {this.branchId,
      this.branchIdErp,
      this.branchCode,
      this.branchName,
      this.zoneId,
      this.branchNameHindi});

  BranchId.fromJson(Map<String, dynamic> json) {
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

class FactoryId {
  int? factoryId;
  CentreId? centreId;
  String? processingFactoryName;
  int? factoryCode;
  bool? isActive;
  String? factoryAddress;
  double? latitude;
  double? longitude;

  FactoryId(
      {this.factoryId,
      this.centreId,
      this.processingFactoryName,
      this.factoryCode,
      this.isActive,
      this.factoryAddress,
      this.latitude,
      this.longitude});

  FactoryId.fromJson(Map<String, dynamic> json) {
    factoryId = json['factoryId'];
    centreId = json['centreId'] != null
        ? new CentreId.fromJson(json['centreId'])
        : null;
    processingFactoryName = json['processingFactoryName'];
    factoryCode = json['factoryCode'];
    isActive = json['isActive'];
    factoryAddress = json['factoryAddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['factoryId'] = this.factoryId;
    if (this.centreId != null) {
      data['centreId'] = this.centreId!.toJson();
    }
    data['processingFactoryName'] = this.processingFactoryName;
    data['factoryCode'] = this.factoryCode;
    data['isActive'] = this.isActive;
    data['factoryAddress'] = this.factoryAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class VarietyId {
  int? varietyId;
  String? varietyName;

  VarietyId({this.varietyId, this.varietyName});

  VarietyId.fromJson(Map<String, dynamic> json) {
    varietyId = json['varietyId'];
    varietyName = json['varietyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['varietyId'] = this.varietyId;
    data['varietyName'] = this.varietyName;
    return data;
  }
}

class Status {
  int? statusId;
  String? status;

  Status({this.statusId, this.status});

  Status.fromJson(Map<String, dynamic> json) {
    statusId = json['statusId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusId'] = this.statusId;
    data['status'] = this.status;
    return data;
  }
}
