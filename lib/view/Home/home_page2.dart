import 'package:dumyapp1/model/menu_model.dart';
import 'package:dumyapp1/provider/menu_item_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Addressbook/address_list_page.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/Home/movies.dart';
import 'package:dumyapp1/view/Home/single_forum.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('# 2 Home'),
      body: Consumer<MenuItemProvider>(
        builder: (context, items, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
            ),
            itemCount: items.menuItemList?.length,
            itemBuilder: (context, index) {
              if (items.isLoading) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final menuItem = items.menuItemList?[index];
                return GestureDetector(
                  onTap: () {
                    switch (menuItem?.fieldRoute) {
                      case MenuUtill.singleEntry:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingleForumPage()),
                        );
                        break;
                      case MenuUtill.moviesList:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoviesPage()),
                        );
                        break;
                      case MenuUtill.userProfile:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const USerProfile()),
                        );
                        break;
                      case MenuUtill.addressBook:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressListPage()),
                        );
                        break;
                      default:
                        debugPrint(
                            "Encountered a invalid menu item \nPlease added the route to ${menuItem?.fieldRoute}");
                        break;
                    }
                  },
                  child: BlueWidgets(menuItem: menuItem),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}

class BlueWidgets extends StatelessWidget {
  const BlueWidgets({
    super.key,
    required this.menuItem,
  });

  final MenuItem? menuItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(98, 135, 158, 210),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              height: 60,
              width: 60,
              child: Image.asset('assets/menu_icons/${menuItem?.fieldIcon}')),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              child: Text(
                menuItem!.fieldName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
