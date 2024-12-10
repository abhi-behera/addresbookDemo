import 'package:flutter/material.dart';

Color appBarColor = const Color.fromRGBO(04, 52, 100, 1);
Color textColor = Colors.white;
bool preference = false;

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: appBarColor,
    elevation: 10,
  );
}
