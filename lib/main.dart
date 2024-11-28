import 'package:dumyapp1/addressListPage.dart';
import 'package:dumyapp1/addressProviderpage.dart';
import 'package:dumyapp1/constValues.dart';
import 'package:dumyapp1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
