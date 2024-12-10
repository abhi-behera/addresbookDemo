import 'dart:convert';

class UserProfileClass {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? isActive;
  String? roleId;
  dynamic isLocked;
  dynamic lockedOn;
  String? phoneNo;
  dynamic countryCode;
  dynamic stateCode;
  dynamic address;
  dynamic zipCode;
  String? citizenShip;
  String? dateOfBirth;
  String? instituteId;
  String? studentCategoryId;
  String? secondaryEmail;
  String? profilePicture;
  String? userStatus;
  dynamic userType;
  dynamic city;
  String? secondaryPhoneNo;
  String? gender;
  String? qrCodePath;
  String? doBiCentFormat;
  String? englishName;
  String? middleName;
  bool? isPrimaryEmailVerified;
  bool? isSecondaryEmailVerified;
  String? digitalSignature;
  dynamic programStatus;
  bool? isPermanentResident;

  UserProfileClass({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.isActive,
    this.roleId,
    this.isLocked,
    this.lockedOn,
    this.phoneNo,
    this.countryCode,
    this.stateCode,
    this.address,
    this.zipCode,
    this.citizenShip,
    this.dateOfBirth,
    this.instituteId,
    this.studentCategoryId,
    this.secondaryEmail,
    this.profilePicture,
    this.userStatus,
    this.userType,
    this.city,
    this.secondaryPhoneNo,
    this.gender,
    this.qrCodePath,
    this.doBiCentFormat,
    this.englishName,
    this.middleName,
    this.isPrimaryEmailVerified,
    this.isSecondaryEmailVerified,
    this.digitalSignature,
    this.programStatus,
    this.isPermanentResident,
  });

  factory UserProfileClass.fromRawJson(String str) =>
      UserProfileClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfileClass.fromJson(Map<String, dynamic> json) =>
      UserProfileClass(
        userId: json["UserID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        isActive: json["IsActive"],
        roleId: json["RoleID"],
        isLocked: json["IsLocked"],
        lockedOn: json["LockedOn"],
        phoneNo: json["PhoneNo"],
        countryCode: json["CountryCode"],
        stateCode: json["StateCode"],
        address: json["Address"],
        zipCode: json["ZipCode"],
        citizenShip: json["CitizenShip"],
        dateOfBirth: json["DateOfBirth"],
        instituteId: json["InstituteID"],
        studentCategoryId: json["StudentCategoryID"],
        secondaryEmail: json["SecondaryEmail"],
        profilePicture: json["profilePicture"],
        userStatus: json["UserStatus"],
        userType: json["UserType"],
        city: json["City"],
        secondaryPhoneNo: json["SecondaryPhoneNo"],
        gender: json["Gender"],
        qrCodePath: json["QRCodePath"],
        doBiCentFormat: json["DOBiCentFormat"],
        englishName: json["EnglishName"],
        middleName: json["MiddleName"],
        isPrimaryEmailVerified: json["IsPrimaryEmailVerified"],
        isSecondaryEmailVerified: json["IsSecondaryEmailVerified"],
        digitalSignature: json["DigitalSignature"],
        programStatus: json["ProgramStatus"],
        isPermanentResident: json["IsPermanentResident"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "IsActive": isActive,
        "RoleID": roleId,
        "IsLocked": isLocked,
        "LockedOn": lockedOn,
        "PhoneNo": phoneNo,
        "CountryCode": countryCode,
        "StateCode": stateCode,
        "Address": address,
        "ZipCode": zipCode,
        "CitizenShip": citizenShip,
        "DateOfBirth": dateOfBirth,
        "InstituteID": instituteId,
        "StudentCategoryID": studentCategoryId,
        "SecondaryEmail": secondaryEmail,
        "profilePicture": profilePicture,
        "UserStatus": userStatus,
        "UserType": userType,
        "City": city,
        "SecondaryPhoneNo": secondaryPhoneNo,
        "Gender": gender,
        "QRCodePath": qrCodePath,
        "DOBiCentFormat": doBiCentFormat,
        "EnglishName": englishName,
        "MiddleName": middleName,
        "IsPrimaryEmailVerified": isPrimaryEmailVerified,
        "IsSecondaryEmailVerified": isSecondaryEmailVerified,
        "DigitalSignature": digitalSignature,
        "ProgramStatus": programStatus,
        "IsPermanentResident": isPermanentResident,
      };
}
