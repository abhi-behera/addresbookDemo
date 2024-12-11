import 'dart:convert';
import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/model/userprofile_model/userprofile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({super.key});

  @override
  State<USerProfile> createState() => _USerProfileState();
}

class _USerProfileState extends State<USerProfile> {
  UserProfile userProfile = UserProfile();
  final Map<String, TextEditingController> textControllers = {};
  final Map<String, String> dropdownValues = {};
  List<String> radioOptionList = ["Yes", "No"];
  String selectedOption = "Yes";
  Future<UserProfile?> loadFormData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('json_data_folder/userProfile.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      if (kDebugMode) {
        print(jsonData);
      }
      userProfile = UserProfile.fromJson(jsonData);

      String? inputDate = userProfile.userProfileClass?.toJson()["DateOfBirth"];

      // Parse the input date string
      DateTime? parsedDate =
          DateFormat("MM/dd/yyyy hh:mm:ss a").parse(inputDate!);

      // Format the date to "Jan-04-2020"
      String? formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);

      print(formattedDate); // Output: Jan-04-2020
      for (var field in userProfile.dynamicFieldList ?? []) {
        switch (field.fieldType) {
          case "TextBox":
            textControllers[field.fieldCode ?? ""] = TextEditingController(
              text:
                  userProfile.userProfileClass?.toJson()[field.fieldCode] ?? "",
            );
            break;
          case "DropDown":
            dropdownValues[field.fieldCode ?? ""] =
                userProfile.userProfileClass?.toJson()[field.fieldCode] ?? "";
            break;
          case "Email":
            textControllers[field.fieldCode ?? ""] = TextEditingController(
              text: (field.fieldCode == 'SecondaryEmail')
                  ? userProfile.userProfileClass?.toJson()[field.fieldCode] ??
                      ""
                  : userProfile.userProfileClass?.toJson()[field.fieldType] ??
                      "",
            );
            break;

          case "Calendar":
            textControllers[field.fieldCode ?? ""] =
                TextEditingController(text: formattedDate ?? "");
            break;
        }
      }
      return userProfile;
    } catch (e) {
      if (kDebugMode) {
        print("error caught : $e");
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    loadFormData();
    if (kDebugMode) {
      print("data : ${userProfile.dynamicFieldList}");
    }
  }

  @override
  void dispose() {
    textControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("USER PROFILE"),
      body: FutureBuilder(
          future: loadFormData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text(data.error.toString()));
            }
            if (data.hasData) {
              return ListView.builder(
                itemCount: userProfile.dynamicFieldList?.length ?? 0,
                itemBuilder: (context, index) {
                  var usrProfileClass = userProfile.userProfileClass;
                  var field = userProfile.dynamicFieldList![index];
                  switch (field.fieldType) {
                    case 'TextBox':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: textControllers[field.fieldCode],
                          decoration: InputDecoration(
                            labelText: field.fieldTitle,
                          ),
                        ),
                      );
                    case 'Calendar':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled:
                              (textControllers[field.fieldCode]?.text != "")
                                  ? false
                                  : true,
                          controller: textControllers[field.fieldCode],
                          decoration: InputDecoration(
                            labelText: field.fieldTitle,
                          ),
                        ),
                      );
                    case 'Email':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled:
                              (textControllers[field.fieldCode]?.text != "")
                                  ? false
                                  : true,
                          controller: textControllers[field.fieldCode],
                          decoration: InputDecoration(
                            labelText: field.fieldTitle,
                          ),
                        ),
                      );

                    case 'DropDown':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          value: usrProfileClass?.gender.toString(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValues[field.fieldCode ?? ""] = newValue!;
                            });
                          },
                          items: userProfile.genderList?.map((gender) {
                            return DropdownMenuItem(
                              value: gender.genderCode,
                              child: Text(gender.gender ?? ""),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: field.fieldTitle,
                          ),
                        ),
                      );

                    case 'RadioButton':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              field.fieldTitle.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ...radioOptionList.map<Widget>((option) {
                              return RadioListTile(
                                title: Text(option),
                                value: option,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              );
                            }).toList(),
                          ],
                        ),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: appBarColor,
              textStyle: TextStyle(color: textColor)),
          onPressed: () {},
          child: const Text("SAVE"),
        ),
      ),
    );
  }
}
