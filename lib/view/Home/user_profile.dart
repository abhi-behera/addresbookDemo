import 'dart:convert';

import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/model/userprofile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({super.key});

  @override
  State<USerProfile> createState() => _USerProfileState();
}

class _USerProfileState extends State<USerProfile> {
  UserProfile userProfile = UserProfile();
  final Map<String, TextEditingController> textControllers = {};
  final Map<String, String> dropdownValues = {};

  Future<UserProfile?> loadFormData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('json_data_folder/userProfile.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      if (kDebugMode) {
        print(jsonData);
      }
      userProfile = UserProfile.fromJson(jsonData);

      for (var field in userProfile.dynamicFieldList ?? []) {
        if (field.fieldType == "TextBox") {
          textControllers[field.fieldCode ?? ""] = TextEditingController(
            text: userProfile.userProfile?.toJson()[field.fieldCode] ?? "",
          );
        } else if (field.fieldType == "DropDown") {
          dropdownValues[field.fieldCode ?? ""] =
              userProfile.userProfile?.toJson()[field.fieldCode] ?? "";
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
      appBar: AppBar(title: const Text("Dynamic Form")),
      body: ListView.builder(
        itemCount: userProfile.dynamicFieldList?.length ?? 0,
        itemBuilder: (context, index) {
          var field = userProfile.dynamicFieldList![index];
          if (field.fieldType == "TextBox") {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textControllers[field.fieldCode],
                decoration: InputDecoration(
                  labelText: field.fieldTitle,
                ),
              ),
            );
          } else if (field.fieldType == "DropDown") {
            // return Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButtonFormField<String>(
            //     value: dropdownValues[field.fieldCode],
            //     onChanged: (newValue) {
            //       setState(() {
            //         dropdownValues[field.fieldCode ?? ""] = newValue!;
            //       });
            //     },
            //     items: userProfile.genderList?.map((gender) {
            //       return DropdownMenuItem<String>(
            //         value: gender.genderCode,
            //         child: Text(gender.gender ?? ""),
            //       );
            //     }).toList(),
            //     decoration: InputDecoration(
            //       labelText: field.fieldTitle,
            //     ),
            //   ),
            // );
          }

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
            // case 'RadioButton':
            //   return Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           fieldData.fieldName.toString(),
            //           style: const TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         ...fieldData.fieldOptions!.map<Widget>((option) {
            //           return RadioListTile(
            //             title: Text(option.text),
            //             value: option.value,
            //             groupValue: fieldData.fieldValue,
            //             onChanged: (value) {
            //               setState(() {
            //                 fieldData.fieldValue = value;
            //               });
            //             },
            //           );
            //         }).toList(),
            //       ],
            //     ),
            //   );
            // case 'Dropdown':
            //   return Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: DropdownButtonFormField(
            //       decoration: InputDecoration(
            //         labelText: field.fieldTitle,
            //         border: const OutlineInputBorder(),
            //       ),
            //       items: (field.fieldOptions as List<dynamic>)
            //           .map<DropdownMenuItem<Object>>(
            //               (option) => DropdownMenuItem<Object>(
            //                     value: option.value,
            //                     child: Text(option.text),
            //                   ))
            //           .toList(),
            //       onChanged: (value) {},
            //     ),
            //   );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
