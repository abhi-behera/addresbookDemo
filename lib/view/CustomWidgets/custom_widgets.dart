import 'package:dumyapp1/utill/utill_values.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: textColor),
    ),
    centerTitle: true,
    backgroundColor: appBarColor,
    elevation: 10,
  );
}

AppBar gradientAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: textColor),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(192, 133, 158, 226),
        Color.fromARGB(192, 118, 152, 247),
        Color.fromARGB(192, 184, 201, 246),
        Color.fromARGB(26, 153, 199, 241),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
