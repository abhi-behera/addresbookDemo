import 'dart:convert';
import 'dart:io';
import 'package:dumyapp1/model/userprofile_model/userprofile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile? userProfile;
  String? formattedDate;
  bool isLoading = true;
  String? errorMessage;
  List<String> radioOptionList = ["Yes", "No"];
  String? selectedOption;
  final Map<String, String> dropdownValues = {};

  UserProfileProvider() {
    loadFormData();
  }

  Future<void> saveUserData(UserProfile userProfile) async {
    try {
      // Collect data from the text fields and other inputs
      Map<String, dynamic> userData = {};

      for (var field in userProfile.dynamicFieldList!) {
        userData[field.fieldCode ?? ""] = field.textControllers?.text ?? "";
      }

      // Add additional user inputs like radio buttons
      // userData["selectedOption"] = userProfile.selectedOption; // Radio button value

      // Convert the data to JSON
      String jsonData = jsonEncode(userData);

      // Get the app's document directory
      final directory = await getApplicationDocumentsDirectory();

      // Ensure the jsonsubmission folder exists
      final submissionFolder = Directory('${directory.path}/jsonsubmission');
      if (!await submissionFolder.exists()) {
        await submissionFolder.create();
      }

      // Count existing files in the folder for naming
      List<FileSystemEntity> files = submissionFolder.listSync();
      int submissionCount = files.length + 1;

      // Create a new file
      File submissionFile =
          File('${submissionFolder.path}/submission$submissionCount.json');

      // Write JSON data to the file
      await submissionFile.writeAsString(jsonData);

      // Show success message
      if (kDebugMode) {
        print("Data saved to: ${submissionFile.path}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error saving data: $e");
      }
    }
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

  void selectRadioButton() {
    (userProfile!.userProfileClass!.isPermanentResident!)
        ? userProfile!.userProfileClass!.isPermanentResident = false
        : userProfile!.userProfileClass!.isPermanentResident = true;
    notifyListeners();
  }

  @override
  void dispose() {
    userProfile?.disposeControllers();
    super.dispose();
  }
}
