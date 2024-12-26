import 'dart:convert';

import 'package:dumyapp1/model/menu_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuItemProvider extends ChangeNotifier {
  // MenuItem? items;
  List<MenuItem>? menuItemList;
  bool isLoading = true;
  String? errorMessage;

  MenuItemProvider() {
    loadFormData();
  }

  Future<void> loadFormData() async {
    try {
      isLoading = true;
      notifyListeners();

      final String jsonString =
          await rootBundle.loadString('json_data_folder/menu.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // items = MenuItem.fromJson(jsonData);

      menuItemList = List<MenuItem>.from(
          jsonData['menu'].map((x) => MenuItem.fromJson(x)));
      debugPrint("menuItemList $menuItemList");
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = "Error: $e";
    }
    notifyListeners();
  }
}
