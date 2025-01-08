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
      style: const TextStyle(color: Colors.black),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(192, 206, 217, 243),
        Color.fromARGB(192, 222, 229, 248),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
