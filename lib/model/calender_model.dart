// import 'dart:convert';

// class Formfield {
//   String? fieldId;
//   String? fieldName;
//   String? fieldType;
//   String? fieldValue;
//   String? fieldMaxLength;
//   bool? isMandate;
//   String? fieldDescription;
//   String? sequence;
//   List<dynamic>? fieldOptions;
//   CalendarConfig? calendarConfig;
//   String? fieldRegex;
//   String? fieldValidationConfig;
//   String? fieldValidationMessage;
//   String? fieldHelpText;
//   String? fieldInfo;
//   bool? isDependent;
//   dynamic fieldDependencyConfig;
//   dynamic fileUploadOption;
//   bool? fieldPaymentEnabled;
//   String? pointsAllocated;
//   bool? fieldOptionPointEnabled;
//   dynamic additionalFieldValues;
//   dynamic multiFileUploadOption;
//   dynamic profileFieldCode;
//   dynamic programLenthList;
//   dynamic optionFieldAutoSelectConfig;
//   bool? enableDefaultFieldConfig;
//   bool? hideField;
//   bool? isReadOnly;
//   bool? enableAutocomplete;
//   dynamic maxGroupLimit;
//   dynamic minGroupRequired;
//   bool? isGroupedField;
//   dynamic groupId;
//   int? groupSequence;
//   dynamic subFieldList;
//   dynamic additionalFieldConfig;
//   int? maxOptionSelection;
//   bool? prepopulateValue;
//   dynamic formula;
//   dynamic config;
//   dynamic groupedFieldDisplayStyle;

//   Formfield({
//     this.fieldId,
//     this.fieldName,
//     this.fieldType,
//     this.fieldValue,
//     this.fieldMaxLength,
//     this.isMandate,
//     this.fieldDescription,
//     this.sequence,
//     this.fieldOptions,
//     this.calendarConfig,
//     this.fieldRegex,
//     this.fieldValidationConfig,
//     this.fieldValidationMessage,
//     this.fieldHelpText,
//     this.fieldInfo,
//     this.isDependent,
//     this.fieldDependencyConfig,
//     this.fileUploadOption,
//     this.fieldPaymentEnabled,
//     this.pointsAllocated,
//     this.fieldOptionPointEnabled,
//     this.additionalFieldValues,
//     this.multiFileUploadOption,
//     this.profileFieldCode,
//     this.programLenthList,
//     this.optionFieldAutoSelectConfig,
//     this.enableDefaultFieldConfig,
//     this.hideField,
//     this.isReadOnly,
//     this.enableAutocomplete,
//     this.maxGroupLimit,
//     this.minGroupRequired,
//     this.isGroupedField,
//     this.groupId,
//     this.groupSequence,
//     this.subFieldList,
//     this.additionalFieldConfig,
//     this.maxOptionSelection,
//     this.prepopulateValue,
//     this.formula,
//     this.config,
//     this.groupedFieldDisplayStyle,
//   });

//   factory Formfield.fromRawJson(String str) =>
//       Formfield.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Formfield.fromJson(Map<String, dynamic> json) => Formfield(
//         fieldId: json["FieldID"],
//         fieldName: json["FieldName"],
//         fieldType: json["FieldType"],
//         fieldValue: json["FieldValue"],
//         fieldMaxLength: json["FieldMaxLength"],
//         isMandate: json["IsMandate"],
//         fieldDescription: json["FieldDescription"],
//         sequence: json["Sequence"],
//         fieldOptions: json["FieldOptions"] == null
//             ? []
//             : List<dynamic>.from(json["FieldOptions"]!.map((x) => x)),
//         calendarConfig: json["CalendarConfig"] == null
//             ? null
//             : CalendarConfig.fromJson(json["CalendarConfig"]),
//         fieldRegex: json["FieldRegex"],
//         fieldValidationConfig: json["FieldValidationConfig"],
//         fieldValidationMessage: json["FieldValidationMessage"],
//         fieldHelpText: json["FieldHelpText"],
//         fieldInfo: json["FieldInfo"],
//         isDependent: json["IsDependent"],
//         fieldDependencyConfig: json["FieldDependencyConfig"],
//         fileUploadOption: json["FileUploadOption"],
//         fieldPaymentEnabled: json["FieldPaymentEnabled"],
//         pointsAllocated: json["PointsAllocated"],
//         fieldOptionPointEnabled: json["FieldOptionPointEnabled"],
//         additionalFieldValues: json["AdditionalFieldValues"],
//         multiFileUploadOption: json["MultiFileUploadOption"],
//         profileFieldCode: json["ProfileFieldCode"],
//         programLenthList: json["ProgramLenthList"],
//         optionFieldAutoSelectConfig: json["OptionFieldAutoSelectConfig"],
//         enableDefaultFieldConfig: json["EnableDefaultFieldConfig"],
//         hideField: json["HideField"],
//         isReadOnly: json["IsReadOnly"],
//         enableAutocomplete: json["EnableAutocomplete"],
//         maxGroupLimit: json["MaxGroupLimit"],
//         minGroupRequired: json["MinGroupRequired"],
//         isGroupedField: json["IsGroupedField"],
//         groupId: json["GroupId"],
//         groupSequence: json["GroupSequence"],
//         subFieldList: json["SubFieldList"],
//         additionalFieldConfig: json["AdditionalFieldConfig"],
//         maxOptionSelection: json["MaxOptionSelection"],
//         prepopulateValue: json["PrepopulateValue"],
//         formula: json["Formula"],
//         config: json["Config"],
//         groupedFieldDisplayStyle: json["GroupedFieldDisplayStyle"],
//       );

//   Map<String, dynamic> toJson() => {
//         "FieldID": fieldId,
//         "FieldName": fieldName,
//         "FieldType": fieldType,
//         "FieldValue": fieldValue,
//         "FieldMaxLength": fieldMaxLength,
//         "IsMandate": isMandate,
//         "FieldDescription": fieldDescription,
//         "Sequence": sequence,
//         "FieldOptions": fieldOptions == null
//             ? []
//             : List<dynamic>.from(fieldOptions!.map((x) => x)),
//         "CalendarConfig": calendarConfig?.toJson(),
//         "FieldRegex": fieldRegex,
//         "FieldValidationConfig": fieldValidationConfig,
//         "FieldValidationMessage": fieldValidationMessage,
//         "FieldHelpText": fieldHelpText,
//         "FieldInfo": fieldInfo,
//         "IsDependent": isDependent,
//         "FieldDependencyConfig": fieldDependencyConfig,
//         "FileUploadOption": fileUploadOption,
//         "FieldPaymentEnabled": fieldPaymentEnabled,
//         "PointsAllocated": pointsAllocated,
//         "FieldOptionPointEnabled": fieldOptionPointEnabled,
//         "AdditionalFieldValues": additionalFieldValues,
//         "MultiFileUploadOption": multiFileUploadOption,
//         "ProfileFieldCode": profileFieldCode,
//         "ProgramLenthList": programLenthList,
//         "OptionFieldAutoSelectConfig": optionFieldAutoSelectConfig,
//         "EnableDefaultFieldConfig": enableDefaultFieldConfig,
//         "HideField": hideField,
//         "IsReadOnly": isReadOnly,
//         "EnableAutocomplete": enableAutocomplete,
//         "MaxGroupLimit": maxGroupLimit,
//         "MinGroupRequired": minGroupRequired,
//         "IsGroupedField": isGroupedField,
//         "GroupId": groupId,
//         "GroupSequence": groupSequence,
//         "SubFieldList": subFieldList,
//         "AdditionalFieldConfig": additionalFieldConfig,
//         "MaxOptionSelection": maxOptionSelection,
//         "PrepopulateValue": prepopulateValue,
//         "Formula": formula,
//         "Config": config,
//         "GroupedFieldDisplayStyle": groupedFieldDisplayStyle,
//       };
// }

// class CalendarConfig {
//   dynamic limitType;
//   dynamic minDate;
//   dynamic maxDate;
//   dynamic dependentField;
//   dynamic dependentInterval;
//   dynamic allowedDates;
//   RestrictedDates? restrictedDates;

//   CalendarConfig({
//     this.limitType,
//     this.minDate,
//     this.maxDate,
//     this.dependentField,
//     this.dependentInterval,
//     this.allowedDates,
//     this.restrictedDates,
//   });

//   factory CalendarConfig.fromRawJson(String str) =>
//       CalendarConfig.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory CalendarConfig.fromJson(Map<String, dynamic> json) => CalendarConfig(
//         limitType: json["LimitType"],
//         minDate: json["MinDate"],
//         maxDate: json["MaxDate"],
//         dependentField: json["DependentField"],
//         dependentInterval: json["DependentInterval"],
//         allowedDates: json["AllowedDates"],
//         restrictedDates: json["RestrictedDates"] == null
//             ? null
//             : RestrictedDates.fromJson(json["RestrictedDates"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "LimitType": limitType,
//         "MinDate": minDate,
//         "MaxDate": maxDate,
//         "DependentField": dependentField,
//         "DependentInterval": dependentInterval,
//         "AllowedDates": allowedDates,
//         "RestrictedDates": restrictedDates?.toJson(),
//       };
// }

// class RestrictedDates {
//   List<dynamic>? customDates;
//   dynamic daysOfMonths;
//   dynamic months;
//   dynamic weekDays;

//   RestrictedDates({
//     this.customDates,
//     this.daysOfMonths,
//     this.months,
//     this.weekDays,
//   });

//   factory RestrictedDates.fromRawJson(String str) =>
//       RestrictedDates.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory RestrictedDates.fromJson(Map<String, dynamic> json) =>
//       RestrictedDates(
//         customDates: json["CustomDates"] == null
//             ? []
//             : List<dynamic>.from(json["CustomDates"]!.map((x) => x)),
//         daysOfMonths: json["DaysOfMonths"],
//         months: json["Months"],
//         weekDays: json["WeekDays"],
//       );

//   Map<String, dynamic> toJson() => {
//         "CustomDates": customDates == null
//             ? []
//             : List<dynamic>.from(customDates!.map((x) => x)),
//         "DaysOfMonths": daysOfMonths,
//         "Months": months,
//         "WeekDays": weekDays,
//       };
// }
