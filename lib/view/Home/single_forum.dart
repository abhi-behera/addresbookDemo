import 'dart:convert';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/model/fieldsModel/formdata_fields_model.dart';
import 'package:dumyapp1/model/fieldsModel/formdata_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SingleForumPage extends StatefulWidget {
  const SingleForumPage({super.key});

  @override
  State<SingleForumPage> createState() => _SingleForumPageState();
}

class _SingleForumPageState extends State<SingleForumPage> {
  FormData frm = FormData();
  // Todo : add this controller to model...
  final Map<String, TextEditingController> textController = {};
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  DateTime? pickedDate;

  // Todo : remove this _selectedGender var...
  String? _selectedGender = "5364";
  Future<FormData?> loadFormData() async {
    try {
      final String jsonString = await rootBundle
          .loadString('json_data_folder/single_entry_adhoc_form.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      frm = FormData.fromJson(jsonData);
      return frm;
    } catch (e) {
      if (kDebugMode) {
        print("error caught : $e");
      }
    }
    return null;
  }

  @override
  void dispose() {
    textController.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Widget _buildField(Field fieldData, BuildContext context) {
    switch (fieldData.fieldType) {
      case SingleFormUtill.singleFormTextBox:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController[fieldData.fieldID],
            decoration: InputDecoration(
              labelText: fieldData.fieldName,
              border: const OutlineInputBorder(),
            ),
          ),
        );
      case SingleFormUtill.singleFormRadioButton:
        return Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 109, 125, 151)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  fieldData.fieldName.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...fieldData.fieldOptions!.map<Widget>((option) {
                return RadioListTile(
                  title: Text(option.text),
                  value: option.value,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                );
              }).toList(),
            ],
          ),
        );
      case SingleFormUtill.singleFormCalender:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  pickedDate = pickedDate;
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: fieldData.fieldName,
                border: const OutlineInputBorder(),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: (pickedDate == null)
                    ? const Text(" Select Date")
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            "Selected Date : ${DateFormat('EEE, d MMM yy, hh:mm aaa').format(pickedDate!)}")), //Text(fieldData['FieldValue'] ?? 'Select Date'),
              ),
            ),
          ),
        );
      case SingleFormUtill.singleFormDropDown:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: fieldData.fieldName,
              border: const OutlineInputBorder(),
            ),
            items: (fieldData.fieldOptions as List<dynamic>)
                .map<DropdownMenuItem<Object>>(
                    (option) => DropdownMenuItem<Object>(
                          value: option.value,
                          child: Text(option.text),
                        ))
                .toList(),
            onChanged: (value) {},
          ),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("SINGLE ENTRY"),
      body: FutureBuilder(
          future: loadFormData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text(data.error.toString()));
            }
            if (data.hasData) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: frm.fields!
                    .map((field) => _buildField(field, context))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 130.0, bottom: 8.0, top: 8.0, right: 130.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: appBarColor,
              textStyle: TextStyle(color: textColor)),
          onPressed: () {},
          child: const Text("SUBMIT"),
        ),
      ),
    );
  }
}
