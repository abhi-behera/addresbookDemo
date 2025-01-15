import 'package:dumyapp1/view/Home/basic_home_page.dart';
import 'package:dumyapp1/view/Home/material_UI_home_page.dart';
import 'package:dumyapp1/view/Home/new_UI_home_page.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        HomePage(),
        HomePage2(),
        HomePage3(),
      ],
    );
  }
}
