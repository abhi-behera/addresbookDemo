import 'package:dumyapp1/view/Home/user_profile.dart';
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
    Widget currentWidgetPage = const SizedBox.shrink();

    switch (_selectedIndex) {
      case 1:
        currentWidgetPage = const HomePage();
        break;
      case 2:
        currentWidgetPage = const USerProfile();
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
          DrawerHeader(
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Image.network(
                      'https://media.licdn.com/dms/image/v2/C5603AQG4etc2xCWQ3Q/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1611021380076?e=1739404800&v=beta&t=21LRZZ1mYJYcfJnLh2sk_776leUaUE4j0-ZQd2kfhTQ'),
                ),
              ),
              const SizedBox(width: 20),
              const Column(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddressListPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_rounded,
              color: Colors.white,
            ),
            title: const Text('User Profile',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const USerProfile()));
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
