import 'dart:convert';

import 'package:dumyapp1/model/dynamicfield_model/dynamicfield_model.dart';
import 'package:dumyapp1/model/userprofile_model/gender_list_model.dart';
import 'package:dumyapp1/model/userprofile_model/userprofile_class_model.dart';

class UserProfile {
  bool? status;
  dynamic errorType;
  UserProfileClass? userProfile;
  bool? userProfileFilled;
  List<DynamicFieldList>? dynamicFieldList;
  List<GenderList>? genderList;

  UserProfile({
    this.status,
    this.errorType,
    this.userProfile,
    this.userProfileFilled,
    this.dynamicFieldList,
    this.genderList,
  });

  factory UserProfile.fromRawJson(String str) =>
      UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["Status"],
        errorType: json["errorType"],
        userProfile: json["userProfile"] == null
            ? null
            : UserProfileClass.fromJson(json["userProfile"]),
        userProfileFilled: json["UserProfileFilled"],
        dynamicFieldList: json["DynamicFieldList"] == null
            ? []
            : List<DynamicFieldList>.from(json["DynamicFieldList"]!
                .map((x) => DynamicFieldList.fromJson(x))),
        genderList: json["GenderList"] == null
            ? []
            : List<GenderList>.from(
                json["GenderList"]!.map((x) => GenderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "errorType": errorType,
        "userProfile": userProfile?.toJson(),
        "UserProfileFilled": userProfileFilled,
        "DynamicFieldList": dynamicFieldList == null
            ? []
            : List<dynamic>.from(dynamicFieldList!.map((x) => x.toJson())),
        "GenderList": genderList == null
            ? []
            : List<dynamic>.from(genderList!.map((x) => x.toJson())),
      };
}
