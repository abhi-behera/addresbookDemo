import 'dart:convert';

import 'package:dumyapp1/model/fieldsModel/formdata_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleEntryProvider extends ChangeNotifier {
  FormData? singleEntry;
  bool isLoading = true;
  String? errorMessage;

  SingleEntryProvider() {
    loadFormData();
  }

  Future<void> loadFormData() async {
    try {
      isLoading = true;
      notifyListeners();

      final String jsonString = await rootBundle
          .loadString('json_data_folder/single_entry_adhoc_form.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      singleEntry = FormData.fromJson(jsonData);

      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = "Error: $e";
    }
    notifyListeners();
  }
}
