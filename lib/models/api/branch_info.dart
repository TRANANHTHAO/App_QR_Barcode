class BranchInfo {
  String? sId;
  String? branchCode;
  String? branchName;
  String? description;
  String? email;
  String? phoneNumber;
  String? website;
  String? address;
  String? issuedDate;
  String? issuedBy;
  String? businessLicense;
  String? avatar;
  int? isPublic;

  BranchInfo(
      {this.sId,
      this.branchCode,
      this.branchName,
      this.description,
      this.email,
      this.phoneNumber,
      this.website,
      this.address,
      this.issuedDate,
      this.issuedBy,
      this.businessLicense,
      this.avatar,
      this.isPublic});

  factory BranchInfo.fromJson(Map<String, dynamic> json) {
    return BranchInfo(
        sId: json['_id'],
        branchCode: json['BranchCode'],
        branchName: json['BranchName'],
        description: json['Description'],
        email: json['Email'],
        phoneNumber: json['PhoneNumber'],
        website: json['Website'],
        address: json['Address'],
        issuedDate: json['IssuedDate'],
        issuedBy: json['IssuedBy'],
        businessLicense: json['BusinessLicense'],
        avatar: json['Avatar'],
        isPublic: json['IsPublic']);
  }
}
