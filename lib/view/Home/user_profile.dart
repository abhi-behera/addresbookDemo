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

      String? formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);

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
                            suffixIcon: IconButton(
                              onPressed:
                                  textControllers[field.fieldCode]?.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            border: const OutlineInputBorder(),
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
                            border: const OutlineInputBorder(),
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
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed:
                                  textControllers[field.fieldCode]?.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            labelText: field.fieldTitle,
                          ),
                        ),
                      );

                    case 'DropDown':
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          value: (field.fieldCode.toString() == "Gender")
                              ? usrProfileClass?.gender.toString()
                              : usrProfileClass?.citizenShip.toString(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValues[field.fieldCode ?? ""] = newValue!;
                            });
                          },
                          items: (field.fieldCode.toString() == "Gender")
                              ? userProfile.genderList?.map((gender) {
                                  return DropdownMenuItem(
                                    value: gender.genderCode,
                                    child: Text(gender.gender ?? ""),
                                  );
                                }).toList()
                              : userProfile.citizenShipList?.map((citizen) {
                                  return DropdownMenuItem(
                                    value: citizen.citizenShip,
                                    child: Text(citizen.citizenShipCode ?? ""),
                                  );
                                }).toList(),
                          decoration: InputDecoration(
                            labelText: field.fieldTitle,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      );

                    case 'RadioButton':
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 109, 125, 151)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                field.fieldTitle.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
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
                padding: const EdgeInsets.all(16.0),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 24.0, bottom: 8.0, top: 8.0, right: 24.0),
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
