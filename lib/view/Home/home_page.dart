import 'dart:convert';

import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/view/Home/single_forum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Map<String, dynamic> jsonData = {};

  @override
  void initState() {
    _loadFormData();
    super.initState();
  }

  Future<void> _loadFormData() async {
    if (kDebugMode) {
      print("load data called");
    }
    final String jsonString = await rootBundle
        .loadString('json_data_folder/single_entry_adhoc_form.json');
    if (kDebugMode) {
      print("jsonString : $jsonString");
    }
    jsonData = json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Home Page'),
      body: SafeArea(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.forum), Text("Single Forum")]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SingleForumPage(jsonData: jsonData)));
                  },
                );
              })),
    );
  }
}
