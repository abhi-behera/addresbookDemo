import 'dart:convert';
import 'package:dumyapp1/model/userprofile_model/userprofile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile? userProfile;
  String? formattedDate;
  bool isLoading = true;
  String? errorMessage;

  UserProfileProvider() {
    loadFormData();
  }

  Future<void> loadFormData() async {
    try {
      isLoading = true;
      notifyListeners();

      final String jsonString =
          await rootBundle.loadString('json_data_folder/userProfile.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      userProfile = UserProfile.fromJson(jsonData);

      if (userProfile?.userProfileClass?.dateOfBirth != null) {
        String inputDate = userProfile!.userProfileClass!.dateOfBirth!;
        DateTime parsedDate =
            DateFormat("MM/dd/yyyy hh:mm:ss a").parse(inputDate);
        formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = "Error: $e";
    }
    notifyListeners();
  }

  @override
  void dispose() {
    userProfile?.disposeControllers();
    super.dispose();
  }
}
