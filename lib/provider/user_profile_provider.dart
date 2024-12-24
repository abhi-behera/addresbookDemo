import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:dumyapp1/model/userprofile_model/userprofile_model.dart';
import 'package:flutter/foundation.dart';
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
    callIsolates();
    // loadFormData();
  }

  Future<void> saveUserData(UserProfile userProfile) async {
    try {
      Map<String, dynamic> userData = {};

      for (var field in userProfile.dynamicFieldList!) {
        userData[field.fieldCode ?? ""] = field.textControllers?.text ?? "";
      }
      String jsonData = jsonEncode(userData);

      final directory = await getApplicationDocumentsDirectory();

      final submissionFolder = Directory('${directory.path}/json_submission');
      if (!await submissionFolder.exists()) {
        await submissionFolder.create();
      }

      List<FileSystemEntity> files = submissionFolder.listSync();
      int submissionCount = files.length + 1;

      File submissionFile =
          File('${submissionFolder.path}/submission$submissionCount.json');

      await submissionFile.writeAsString(jsonData);

      if (kDebugMode) {
        print("Data saved to: ${submissionFile.path}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error saving data: $e");
      }
    }
  }

//  with isolates
  Future<void> callIsolates() async {
    debugPrint("Isolates called");

    final receivePort = ReceivePort();

    try {
      final String jsonString =
          await rootBundle.loadString('json_data_folder/userProfile.json');

      await Isolate.spawn(loadFormData, [receivePort.sendPort, jsonString]);

      receivePort.listen((message) {
        if (message is Map<String, dynamic>) {
          userProfile = UserProfile.fromJson(message);

          if (userProfile?.userProfileClass?.dateOfBirth != null) {
            String inputDate = userProfile!.userProfileClass!.dateOfBirth!;
            DateTime parsedDate =
                DateFormat("MM/dd/yyyy hh:mm:ss a").parse(inputDate);
            formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);
          }
          isLoading = false;
          notifyListeners();
        } else if (message is String) {
          errorMessage = message;
          isLoading = false;
          notifyListeners();
        }
      });
    } catch (e) {
      errorMessage = "Error starting isolate: $e";
      isLoading = false;
      notifyListeners();
    }
  }

  static Future<void> loadFormData(List<dynamic> params) async {
    SendPort sendPort = params[0];
    String jsonString = params[1];

    try {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      sendPort.send(jsonData);
    } catch (e) {
      debugPrint(e.toString());
      sendPort.send("Error: $e");
    }
  }

// without isolates
  // Future<void> loadFormData() async {
  //   try {
  //     isLoading = true;
  //     notifyListeners();

  //     final String jsonString =
  //         await rootBundle.loadString('json_data_folder/userProfile.json');
  //     final Map<String, dynamic> jsonData = jsonDecode(jsonString);
  //     userProfile = UserProfile.fromJson(jsonData);

  //     if (userProfile?.userProfileClass?.dateOfBirth != null) {
  //       String inputDate = userProfile!.userProfileClass!.dateOfBirth!;
  //       DateTime parsedDate =
  //           DateFormat("MM/dd/yyyy hh:mm:ss a").parse(inputDate);
  //       formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);
  //     }

  //     isLoading = false;
  //   } catch (e) {
  //     isLoading = false;
  //     errorMessage = "Error: $e";
  //   }
  //   notifyListeners();
  // }

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
