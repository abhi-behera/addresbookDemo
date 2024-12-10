// Form Model
import 'package:dumyapp1/model/fieldsModel/formdata_fields_model.dart';
import 'package:flutter/foundation.dart';

class FormData {
  final String? formName;
  final String? formCategory;
  final String? buttonType;
  final List<Field>? fields;

  FormData({
    this.formName,
    this.formCategory,
    this.buttonType,
    this.fields,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print("form data fromJson called");
    }

    if (kDebugMode) {
      print("form name : ${json['FormName']}");
    }
    return FormData(
      formName: json['FormName'],
      formCategory: json['FormCategory'],
      buttonType: json['ButtonType'],
      fields: (json['Fields'] as List<dynamic>)
          .map((field) => Field.fromJson(field))
          .toList(),
    );
  }
}
