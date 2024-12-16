import 'dart:convert';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
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
  String? _formattedDate;
  // Todo : add this controller to model...
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

      _formattedDate = DateFormat("MMM-dd-yyyy").format(parsedDate);
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
                itemCount: userProfile.dynamicFieldList!.length + 1,
                itemBuilder: (context, index) {
                  if (index == userProfile.dynamicFieldList!.length) {
                    // Add the button at the end
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(130, 5, 130, 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appBarColor,
                        ),
                        onPressed: () {
                          // Button action
                        },
                        child: const Text("SAVE"),
                      ),
                    );
                  } else {
                    var usrProfileClass = userProfile.userProfileClass;
                    var field = userProfile.dynamicFieldList![index];
                    switch (field.fieldType) {
                      case UserProfileFormUtill.userProfileFormTextBox:
                        {
                          textControllers[field.fieldCode ?? ""] =
                              TextEditingController(
                                  text: userProfile.userProfileClass
                                          ?.toJson()[field.fieldCode] ??
                                      "");
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
                        }
                      case UserProfileFormUtill.userProfileFormCalender:
                        {
                          textControllers[field.fieldCode ?? ""] =
                              TextEditingController(text: _formattedDate);
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
                        }
                      case UserProfileFormUtill.userProfileFormEmail:
                        {
                          textControllers[field.fieldCode ?? ""] =
                              TextEditingController(
                            text: (field.fieldCode == 'SecondaryEmail')
                                ? userProfile.userProfileClass
                                        ?.toJson()[field.fieldCode] ??
                                    ""
                                : userProfile.userProfileClass
                                        ?.toJson()[field.fieldType] ??
                                    "",
                          );
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
                        }
                      case UserProfileFormUtill.userProfileFormDropDown:
                        {
                          dropdownValues[field.fieldCode ?? ""] = userProfile
                                  .userProfileClass
                                  ?.toJson()[field.fieldCode] ??
                              "";
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField(
                              value: (field.fieldCode.toString() == "Gender")
                                  ? usrProfileClass?.gender.toString()
                                  : usrProfileClass?.citizenShip.toString(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValues[field.fieldCode ?? ""] =
                                      newValue!;
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
                                        child:
                                            Text(citizen.citizenShipCode ?? ""),
                                      );
                                    }).toList(),
                              decoration: InputDecoration(
                                labelText: field.fieldTitle,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          );
                        }
                      case UserProfileFormUtill.userProfileFormRadioButton:
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 109, 125, 151)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
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

                    // if (field.fieldType ==
                    //     UserProfileFormUtill.userProfileFormDropDown) {
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: DropdownButtonFormField(
                    //       value: (field.fieldCode.toString() == "Gender")
                    //           ? usrProfileClass?.gender.toString()
                    //           : usrProfileClass?.citizenShip.toString(),
                    //       onChanged: (newValue) {
                    //         setState(() {
                    //           dropdownValues[field.fieldCode ?? ""] =
                    //               newValue!;
                    //         });
                    //       },
                    //       items: (field.fieldCode.toString() == "Gender")
                    //           ? userProfile.genderList?.map((gender) {
                    //               return DropdownMenuItem(
                    //                 value: gender.genderCode,
                    //                 child: Text(gender.gender ?? ""),
                    //               );
                    //             }).toList()
                    //           : userProfile.citizenShipList?.map((citizen) {
                    //               return DropdownMenuItem(
                    //                 value: citizen.citizenShip,
                    //                 child:
                    //                     Text(citizen.citizenShipCode ?? ""),
                    //               );
                    //             }).toList(),
                    //       decoration: InputDecoration(
                    //         labelText: field.fieldTitle,
                    //         border: const OutlineInputBorder(),
                    //       ),
                    //     ),
                    //   );
                    // }
                    // if(field.fieldType == UserProfileFormUtill.userProfileFormTextBox){
                    // Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: TextField(
                    //         controller: textControllers[field.fieldCode],
                    //         decoration: InputDecoration(
                    //           labelText: field.fieldTitle,
                    //           suffixIcon: IconButton(
                    //             onPressed:
                    //                 textControllers[field.fieldCode]?.clear,
                    //             icon: const Icon(Icons.clear),
                    //           ),
                    //           border: const OutlineInputBorder(),
                    //         ),
                    //       ),
                    //     );
                    // }
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
    );
  }
}
