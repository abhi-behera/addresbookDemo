import 'dart:convert';

class FormfieldModel {
  String? fieldId;
  String? fieldName;
  String? fieldType;
  String? fieldValue;
  String? fieldMaxLength;
  bool? isMandate;
  String? fieldDescription;
  String? sequence;
  List<dynamic>? fieldOptions;
  dynamic calendarConfig;
  String? fieldRegex;
  String? fieldValidationConfig;
  String? fieldValidationMessage;
  String? fieldHelpText;
  String? fieldInfo;
  bool? isDependent;
  dynamic fieldDependencyConfig;
  dynamic fileUploadOption;
  bool? fieldPaymentEnabled;
  String? pointsAllocated;
  bool? fieldOptionPointEnabled;
  dynamic additionalFieldValues;
  dynamic multiFileUploadOption;
  dynamic profileFieldCode;
  dynamic programLenthList;
  dynamic optionFieldAutoSelectConfig;
  bool? enableDefaultFieldConfig;
  bool? hideField;
  bool? isReadOnly;
  bool? enableAutocomplete;
  dynamic maxGroupLimit;
  dynamic minGroupRequired;
  bool? isGroupedField;
  dynamic groupId;
  int? groupSequence;
  dynamic subFieldList;
  dynamic additionalFieldConfig;
  int? maxOptionSelection;
  bool? prepopulateValue;
  dynamic formula;
  dynamic config;
  dynamic groupedFieldDisplayStyle;

  FormfieldModel({
    this.fieldId,
    this.fieldName,
    this.fieldType,
    this.fieldValue,
    this.fieldMaxLength,
    this.isMandate,
    this.fieldDescription,
    this.sequence,
    this.fieldOptions,
    this.calendarConfig,
    this.fieldRegex,
    this.fieldValidationConfig,
    this.fieldValidationMessage,
    this.fieldHelpText,
    this.fieldInfo,
    this.isDependent,
    this.fieldDependencyConfig,
    this.fileUploadOption,
    this.fieldPaymentEnabled,
    this.pointsAllocated,
    this.fieldOptionPointEnabled,
    this.additionalFieldValues,
    this.multiFileUploadOption,
    this.profileFieldCode,
    this.programLenthList,
    this.optionFieldAutoSelectConfig,
    this.enableDefaultFieldConfig,
    this.hideField,
    this.isReadOnly,
    this.enableAutocomplete,
    this.maxGroupLimit,
    this.minGroupRequired,
    this.isGroupedField,
    this.groupId,
    this.groupSequence,
    this.subFieldList,
    this.additionalFieldConfig,
    this.maxOptionSelection,
    this.prepopulateValue,
    this.formula,
    this.config,
    this.groupedFieldDisplayStyle,
  });

  factory FormfieldModel.fromRawJson(String str) =>
      FormfieldModel.fromJson(json.decode(str));

  factory FormfieldModel.fromJson(Map<String, dynamic> json) => FormfieldModel(
        fieldId: json["FieldID"],
        fieldName: json["FieldName"],
        fieldType: json["FieldType"],
        fieldValue: json["FieldValue"],
        fieldMaxLength: json["FieldMaxLength"],
        isMandate: json["IsMandate"],
        fieldDescription: json["FieldDescription"],
        sequence: json["Sequence"],
        fieldOptions: json["FieldOptions"] == null
            ? []
            : List<dynamic>.from(json["FieldOptions"]!.map((x) => x)),
        calendarConfig: json["CalendarConfig"],
        fieldRegex: json["FieldRegex"],
        fieldValidationConfig: json["FieldValidationConfig"],
        fieldValidationMessage: json["FieldValidationMessage"],
        fieldHelpText: json["FieldHelpText"],
        fieldInfo: json["FieldInfo"],
        isDependent: json["IsDependent"],
        fieldDependencyConfig: json["FieldDependencyConfig"],
        fileUploadOption: json["FileUploadOption"],
        fieldPaymentEnabled: json["FieldPaymentEnabled"],
        pointsAllocated: json["PointsAllocated"],
        fieldOptionPointEnabled: json["FieldOptionPointEnabled"],
        additionalFieldValues: json["AdditionalFieldValues"],
        multiFileUploadOption: json["MultiFileUploadOption"],
        profileFieldCode: json["ProfileFieldCode"],
        programLenthList: json["ProgramLenthList"],
        optionFieldAutoSelectConfig: json["OptionFieldAutoSelectConfig"],
        enableDefaultFieldConfig: json["EnableDefaultFieldConfig"],
        hideField: json["HideField"],
        isReadOnly: json["IsReadOnly"],
        enableAutocomplete: json["EnableAutocomplete"],
        maxGroupLimit: json["MaxGroupLimit"],
        minGroupRequired: json["MinGroupRequired"],
        isGroupedField: json["IsGroupedField"],
        groupId: json["GroupId"],
        groupSequence: json["GroupSequence"],
        subFieldList: json["SubFieldList"],
        additionalFieldConfig: json["AdditionalFieldConfig"],
        maxOptionSelection: json["MaxOptionSelection"],
        prepopulateValue: json["PrepopulateValue"],
        formula: json["Formula"],
        config: json["Config"],
        groupedFieldDisplayStyle: json["GroupedFieldDisplayStyle"],
      );
}
