import 'package:dumyapp1/view/address_list_page.dart';
import 'package:dumyapp1/const_values.dart';
import 'package:dumyapp1/view/Home/home_page.dart';
import 'package:dumyapp1/view/profilePage.dart';
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
      _selectedIndex = index;
      if (index == 0) {
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.6;
    Widget currentWidgetPage = const SizedBox.shrink();

    switch (_selectedIndex) {
      case 1:
        currentWidgetPage = HomePage();
        break;
      case 2:
        currentWidgetPage = Profilepage();
        break;
    }
    return Scaffold(
      key: _scaffoldKey,
      body: currentWidgetPage,
      drawer: drawer(screenWidth, context),
      bottomNavigationBar: bottomnavBar(),
    );
  }

  Drawer drawer(double screenWidth, BuildContext context) {
    return Drawer(
      width: screenWidth,
      backgroundColor: appBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Row(children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Hello, Abhijit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              )
            ]),
          ),
          Divider(
            color: textColor,
          ),
          ListTile(
            leading: const Icon(
              Icons.home_max_outlined,
              color: Colors.white,
            ),
            title: const Text('Address',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddressListPage()));
            },
          ),
        ],
      ),
    );
  }

  BottomNavigationBar bottomnavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromRGBO(04, 52, 100, 1),
          ),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color.fromRGBO(04, 52, 100, 1)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Color.fromRGBO(04, 52, 100, 1)),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromRGBO(04, 52, 100, 1),
      onTap: _onItemTapped,
    );
  }
}
