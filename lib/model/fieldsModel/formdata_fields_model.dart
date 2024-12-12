// Field Model
import 'package:flutter/foundation.dart';

class Field {
  final String? fieldID;
  final String? fieldName;
  final String? fieldType;
  String? fieldValue;
  final int? fieldMaxLength;
  final bool? isMandate;
  final String? fieldRegex;
  final String? fieldValidationMessage;
  final List<FieldOption>? fieldOptions;

  Field({
    this.fieldID,
    this.fieldName,
    this.fieldType,
    this.fieldValue,
    this.fieldMaxLength,
    this.isMandate,
    this.fieldRegex,
    this.fieldValidationMessage,
    this.fieldOptions,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      fieldID: json['FieldID'],
      fieldName: json['FieldName'],
      fieldType: json['FieldType'],
      fieldValue: json['FieldValue'],
      fieldMaxLength: int.parse(json['FieldMaxLength'] ?? '0'),
      isMandate: json['IsMandate'],
      fieldRegex: json['FieldRegex'],
      fieldValidationMessage: json['FieldValidationMessage'],
      fieldOptions: (json['FieldOptions'] as List<dynamic>?)
          ?.map((option) => FieldOption.fromJson(option))
          .toList(),
    );
  }
}

// FieldOption Model
class FieldOption {
  final String value;
  final String text;

  FieldOption({required this.value, required this.text});

  factory FieldOption.fromJson(Map<String, dynamic> json) {
    return FieldOption(
      value: json['Value'],
      text: json['Text'],
    );
  }
}
