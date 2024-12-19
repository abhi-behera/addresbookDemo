import 'dart:convert';

import 'package:dumyapp1/model/dynamicfield_model/dynamicfield_model.dart';
import 'package:dumyapp1/model/userprofile_model/citizenship_model.dart';
import 'package:dumyapp1/model/userprofile_model/gender_list_model.dart';
import 'package:dumyapp1/model/userprofile_model/userprofile_class_model.dart';
import 'package:flutter/material.dart';

class UserProfile {
  bool? status;
  dynamic errorType;
  UserProfileClass? userProfileClass;
  bool? userProfileFilled;
  List<DynamicFieldList>? dynamicFieldList;
  List<GenderList>? genderList;
  List<CitizenShipList>? citizenShipList;

  UserProfile({
    this.status,
    this.errorType,
    this.userProfileClass,
    this.userProfileFilled,
    this.dynamicFieldList,
    this.genderList,
    this.citizenShipList,
  }) {
    _initializeTextControllers();
  }

  void _initializeTextControllers() {
    if (dynamicFieldList != null) {
      for (var field in dynamicFieldList!) {
        final fieldValue = userProfileClass?.toJson()[field.fieldCode];

        final fieldText = fieldValue != null ? fieldValue.toString() : "";

        field.textControllers = TextEditingController(text: fieldText);
      }
    }
  }

  void disposeControllers() {
    if (dynamicFieldList != null) {
      for (var field in dynamicFieldList!) {
        field.textControllers?.dispose();
      }
    }
  }

  factory UserProfile.fromRawJson(String str) =>
      UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["Status"],
        errorType: json["errorType"],
        userProfileClass: json["userProfile"] == null
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
        citizenShipList: json["CitizenShipList"] == null
            ? []
            : List<CitizenShipList>.from(json["CitizenShipList"]!
                .map((x) => CitizenShipList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "errorType": errorType,
        "userProfile": userProfileClass?.toJson(),
        "UserProfileFilled": userProfileFilled,
        "DynamicFieldList": dynamicFieldList == null
            ? []
            : List<dynamic>.from(dynamicFieldList!.map((x) => x.toJson())),
        "GenderList": genderList == null
            ? []
            : List<dynamic>.from(genderList!.map((x) => x.toJson())),
        "CitizenShipList": citizenShipList == null
            ? []
            : List<dynamic>.from(citizenShipList!.map((x) => x.toJson())),
      };
}
