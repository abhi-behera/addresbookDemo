import 'package:dumyapp1/utill/utill_values.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: appBarColor,
    elevation: 10,
  );
}
