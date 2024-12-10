import 'dart:convert';

import 'package:dumyapp1/model/dynamicfield_model/enum_values_model.dart';

class DynamicFieldList {
  String? fieldCode;
  bool? isMandate;
  bool? isReadonly;
  String? regularExpression;
  String? fieldTitle;
  FieldHelpText? fieldHelpText;
  FieldInfo? fieldInfo;
  bool? isVisible;
  String? validationMessage;
  String? regularExpression4Web;
  FormCode? formCode;
  String? componentId;
  String? fieldType;

  DynamicFieldList({
    this.fieldCode,
    this.isMandate,
    this.isReadonly,
    this.regularExpression,
    this.fieldTitle,
    this.fieldHelpText,
    this.fieldInfo,
    this.isVisible,
    this.validationMessage,
    this.regularExpression4Web,
    this.formCode,
    this.componentId,
    this.fieldType,
  });

  factory DynamicFieldList.fromRawJson(String str) =>
      DynamicFieldList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DynamicFieldList.fromJson(Map<String, dynamic> json) =>
      DynamicFieldList(
        fieldCode: json["FieldCode"],
        isMandate: json["IsMandate"],
        isReadonly: json["IsReadonly"],
        regularExpression: json["RegularExpression"],
        fieldTitle: json["FieldTitle"],
        fieldHelpText: fieldHelpTextValues.map[json["FieldHelpText"]]!,
        fieldInfo: fieldInfoValues.map[json["FieldInfo"]]!,
        isVisible: json["IsVisible"],
        validationMessage: json["ValidationMessage"],
        regularExpression4Web: json["RegularExpression4Web"],
        formCode: formCodeValues.map[json["FormCode"]]!,
        componentId: json["ComponentID"],
        fieldType: json["FieldType"],
      );

  Map<String, dynamic> toJson() => {
        "FieldCode": fieldCode,
        "IsMandate": isMandate,
        "IsReadonly": isReadonly,
        "RegularExpression": regularExpression,
        "FieldTitle": fieldTitle,
        "FieldHelpText": fieldHelpTextValues.reverse[fieldHelpText],
        "FieldInfo": fieldInfoValues.reverse[fieldInfo],
        "IsVisible": isVisible,
        "ValidationMessage": validationMessage,
        "RegularExpression4Web": regularExpression4Web,
        "FormCode": formCodeValues.reverse[formCode],
        "ComponentID": componentId,
        "FieldType": fieldType,
      };
}

enum FieldHelpText { empty, selectOptions }

final fieldHelpTextValues = EnumValues(
    {"": FieldHelpText.empty, "Selcet options": FieldHelpText.selectOptions});

enum FieldInfo { empty, permanentResidentOptions }

final fieldInfoValues = EnumValues({
  "": FieldInfo.empty,
  "Select Permanent Resident options": FieldInfo.permanentResidentOptions
});

enum FormCode { userProfile }

final formCodeValues = EnumValues({"UserProfile": FormCode.userProfile});
