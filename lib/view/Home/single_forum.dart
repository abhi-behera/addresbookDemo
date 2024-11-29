import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/model/formfield_model.dart';
import 'package:dumyapp1/provider/formfield_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SingleForumPage extends StatefulWidget {
  const SingleForumPage({super.key});

  @override
  State<SingleForumPage> createState() => _SingleForumPageState();
}

class _SingleForumPageState extends State<SingleForumPage> {
  @override
  Widget build(BuildContext context) {
    final fields = context.watch<FormProvider>().fields;

    return Scaffold(
      appBar: customAppBar("Single Entry Form"),
      body: FutureBuilder(
        future: _loadFormData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: fields.length,
            itemBuilder: (context, index) {
              final field = fields[index];
              return _buildField(context, field);
            },
          );
        },
      ),
    );
  }

  Widget _buildField(BuildContext context, FormfieldModel field) {
    switch (field.fieldType) {
      case 'InputBox':
        return TextField(
          decoration: InputDecoration(labelText: field.fieldName),
          onChanged: (value) {
            context
                .read<FormProvider>()
                .updateFieldValue(field.fieldId.toString(), value);
          },
        );
      case 'RadioButton':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.fieldName.toString()),
            ...field.fieldOptions!.map((option) {
              return RadioListTile(
                value: option.value,
                groupValue: field.fieldValue,
                title: Text(option.text),
                onChanged: (value) {
                  context.read<FormProvider>().updateFieldValue(
                      field.fieldId.toString(), value.toString());
                },
              );
            }).toList(),
          ],
        );
      case 'Dropdown':
        return DropdownButtonFormField(
          decoration: InputDecoration(labelText: field.fieldName),
          items: field.fieldOptions!
              .map((option) => DropdownMenuItem(
                    value: option.value,
                    child: Text(option.text),
                  ))
              .toList(),
          onChanged: (value) {
            context
                .read<FormProvider>()
                .updateFieldValue(field.fieldId.toString(), value.toString());
          },
        );
      case 'Calendar':
        return TextField(
          decoration: InputDecoration(
            labelText: field.fieldName,
            suffixIcon: Icon(Icons.calendar_today),
          ),
          readOnly: true,
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (selectedDate != null) {
              context.read<FormProvider>().updateFieldValue(
                  field.fieldId.toString(), selectedDate.toIso8601String());
            }
          },
        );
      default:
        return Container();
    }
  }

  Future<void> _loadFormData(BuildContext context) async {
    final String jsonString = await rootBundle.loadString('assets/file.json');

    final Map<String, dynamic> jsonData =
        json.decode(jsonString); // Replace with your JSON
    final fields = (jsonData['Fields'] as List)
        .map((field) => FormfieldModel.fromJson(field))
        .toList();
    context.read<FormProvider>().setFields(fields);
  }
}
