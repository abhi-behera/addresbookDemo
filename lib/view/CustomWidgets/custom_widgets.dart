import 'package:dumyapp1/utill/utill_values.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: textColor),
    ),
    centerTitle: true,
       flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(140, 183, 235, 1),
        Color.fromARGB(192, 233, 236, 246),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    ),
    backgroundColor: const Color.fromRGBO(140, 183, 235, 1), //appBarColor,
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
        Color.fromRGBO(140, 183, 235, 1),
        Color.fromARGB(192, 233, 236, 246),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
