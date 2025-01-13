import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Home/category_page.dart';
import 'package:dumyapp1/view/Home/new_UI_home_page.dart';
// import 'package:dumyapp1/view/Home/home_page3.dart';
import 'package:dumyapp1/view/ScafoldingPage/drawer.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
// import 'package:dumyapp1/view/Home/home_page.dart';
import 'package:flutter/material.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  NavbarScreenState createState() => NavbarScreenState();
}

class NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 1;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _scaffoldKey.currentState?.openDrawer();
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      key: _scaffoldKey,
      body: (_selectedIndex == 1)
          ? const HomePage2()
          : (_selectedIndex == 2)
              ? const CategoryPage()
              : const USerProfile(),
      drawer: drawer(screenWidth, context),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.612),
        buttonBackgroundColor: appBarColor,
        animationDuration: const Duration(milliseconds: 300),
        color: const Color.fromARGB(72, 119, 138, 213),
        items: const <Widget>[
          ImageIcon(
            AssetImage("assets/menu_icons/menu.png"),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          ImageIcon(
            AssetImage("assets/menu_icons/home.png"),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          ImageIcon(
            AssetImage("assets/menu_icons/app.png"),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          // ImageIcon(
          //   AssetImage("assets/menu_icons/home.png"),
          //   color: Color.fromARGB(255, 255, 255, 255),
          // ),
          ImageIcon(
            AssetImage("assets/menu_icons/user.png"),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
      //  bottomnavBar(),
    );
  }

  // BottomNavigationBar bottomnavBar() {
  //   return BottomNavigationBar(
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: ImageIcon(
  //           AssetImage("assets/menu_icons/app.png"),
  //           color: Color(0xFF3A5A98),
  //         ),
  //         label: 'Menu',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: ImageIcon(
  //           AssetImage("assets/menu_icons/home.png"),
  //           color: Color(0xFF3A5A98),
  //         ),
  //         label: 'Home',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: ImageIcon(
  //           AssetImage("assets/menu_icons/home.png"),
  //           color: Color(0xFF3A5A98),
  //         ),
  //         label: 'Home2',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: ImageIcon(
  //           AssetImage("assets/menu_icons/home.png"),
  //           color: Color(0xFF3A5A98),
  //         ),
  //         label: 'Home3',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: ImageIcon(
  //           AssetImage("assets/menu_icons/user.png"),
  //           color: Color(0xFF3A5A98),
  //         ),
  //         label: 'Profile',
  //       ),
  //     ],
  //     currentIndex: _selectedIndex,
  //     selectedItemColor: const Color.fromRGBO(58, 90, 152, 1),
  //     onTap: _onItemTapped,
  //   );
  // }
}
