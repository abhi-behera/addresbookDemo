import 'package:dumyapp1/view/Home/home_page2.dart';
import 'package:dumyapp1/view/Home/home_page3.dart';
import 'package:dumyapp1/view/ScafoldingPage/drawer.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:dumyapp1/view/Home/home_page.dart';
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
          ? const HomePage()
          : (_selectedIndex == 2)
              ? const HomePage2()
              : (_selectedIndex == 3)
                  ? const HomePage3()
                  : const USerProfile(),
      drawer: drawer(screenWidth, context),
      bottomNavigationBar: bottomnavBar(),
    );
  }

  BottomNavigationBar bottomnavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/menu_icons/app.png"),
            color: Color(0xFF3A5A98),
          ),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/menu_icons/home.png"),
            color: Color(0xFF3A5A98),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/menu_icons/home.png"),
            color: Color(0xFF3A5A98),
          ),
          label: 'Home2',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/menu_icons/home.png"),
            color: Color(0xFF3A5A98),
          ),
          label: 'Home3',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/menu_icons/user.png"),
            color: Color(0xFF3A5A98),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromRGBO(58, 90, 152, 1),
      onTap: _onItemTapped,
    );
  }
}
