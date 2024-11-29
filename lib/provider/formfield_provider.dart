import 'package:dumyapp1/model/formfield_model.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final List<FormfieldModel> _fields = [];

  List<FormfieldModel> get fields => _fields;

  void setFields(List<FormfieldModel> fields) {
    _fields.clear();
    _fields.addAll(fields);
    notifyListeners();
  }

  void updateFieldValue(String fieldID, String value) {
    final field = _fields.firstWhere((field) => field.fieldId == fieldID);
    field.fieldValue = value;
    notifyListeners();
  }
}
