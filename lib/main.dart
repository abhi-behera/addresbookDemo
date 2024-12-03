import 'package:dumyapp1/provider/address_provider_page.dart';
import 'package:dumyapp1/provider/formfield_provider.dart';
import 'package:dumyapp1/view/navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        // ChangeNotifierProvider(create: (_) => FormProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavbarScreen(),
    );
  }
}
