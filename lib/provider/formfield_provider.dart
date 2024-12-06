import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  // final List<FormfieldModel> _fields = [];
  // final Map<String?, TextEditingController> _controllers = {};
  // List<FormfieldModel> get fields => _fields;
  // Map<String?, TextEditingController> get controllers => _controllers;

  // void setFields(List<FormfieldModel> fields) {
  //   _fields.clear();
  //   _controllers.clear();
  //   _fields.addAll(fields);

  // Initialize controllers for each field
  //   for (var field in fields) {
  //     if (field.fieldType == "InputBox") {
  //       _controllers[field.fieldId] =
  //           TextEditingController(text: field.fieldValue);
  //     }
  //   }
  //   notifyListeners();
  // }

  // void updateFieldValue(String fieldID, String value) {
  //   final field = _fields.firstWhere((field) => field.fieldId == fieldID);
  //   field.fieldValue = value;

  // Update controller value
  //   if (_controllers.containsKey(fieldID)) {
  //     _controllers[fieldID]!.text = value;
  //   }
  //   notifyListeners();
  // }

  // void disposeControllers() {
  //   // Dispose all controllers
  //   _controllers.values.forEach((controller) => controller.dispose());
  // }

  // Future<List<FormData>> loadFormData() async {
  // print("load data called");
  // // WidgetsFlutterBinding.ensureInitialized();

  // final jsonString =
  //     await rootBundle.loadString('assets/single_entry_adhoc_form.json');
  // final jsonData = jsonDecode(jsonString);

  // Future<void> loadFormData() async {
  //   if (kDebugMode) {
  //     print("load data called");
  //   }
  //   final String jsonString = await rootBundle
  //       .loadString('json_data_folder/single_entry_adhoc_form.json');
  //   if (kDebugMode) {
  //     print("jsonString : $jsonString");
  //   }
  //   final jsonData = json.decode(jsonString);
  //   // }

  //   notifyListeners();
  //   return jsonData.map<FormData>(FormData.fromJson).toList();
  // }
}
