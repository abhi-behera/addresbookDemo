import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/model/formfield_model.dart';
import 'package:dumyapp1/provider/formfield_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class SingleForumPage extends StatefulWidget {
  final Map<String, dynamic> jsonData;

  SingleForumPage({required this.jsonData});

  @override
  State<SingleForumPage> createState() => _SingleForumPageState();
}

class _SingleForumPageState extends State<SingleForumPage> {
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  DateTime? pickedDate;

  Widget _buildField(Map<String, dynamic> fieldData, BuildContext context) {
    switch (fieldData['FieldType']) {
      case 'InputBox':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: fieldData['FieldName'],
              hintText: fieldData['FieldDescription'],
              border: const OutlineInputBorder(),
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
                fieldData['FieldName'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ...fieldData['FieldOptions'].map<Widget>((option) {
                return RadioListTile(
                  title: Text(option['Text']),
                  value: option['Value'],
                  groupValue: fieldData['FieldValue'],
                  onChanged: (value) {
                    setState(() {
                      fieldData['FieldValue'] = value;
                    });
                  },
                );
              }).toList(),
            ],
          ),
        );
      case 'Calendar':
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
                labelText: fieldData['FieldName'],
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
      case 'Dropdown':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: fieldData['FieldName'],
              border: const OutlineInputBorder(),
            ),
            items: (fieldData['FieldOptions'] as List<dynamic>)
                .map<DropdownMenuItem<Object>>(
                    (option) => DropdownMenuItem<Object>(
                          value: option['Value'],
                          child: Text(option['Text']),
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
    List<dynamic> fields = widget.jsonData['Fields'];
    return Scaffold(
      appBar: customAppBar(widget.jsonData['FormName']),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: fields.map((field) => _buildField(field, context)).toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: appBarColor),
          onPressed: () {},
          child: Text(widget.jsonData['ButtonType']),
        ),
      ),
    );
  }
}
