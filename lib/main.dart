import 'package:dumyapp1/provider/address_provider_page.dart';
import 'package:dumyapp1/provider/formfield_provider.dart';
import 'package:dumyapp1/provider/movie_provider.dart';
import 'package:dumyapp1/provider/user_profile_provider.dart';
import 'package:dumyapp1/view/ScafoldingPage/navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => SingleEntryProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavbarScreen(),
    );
  }
}
