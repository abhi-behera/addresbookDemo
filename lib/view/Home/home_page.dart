import 'package:dumyapp1/model/menu_model.dart';
import 'package:dumyapp1/provider/menu_item_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Addressbook/address_list_page.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/MovieList/movies.dart';
import 'package:dumyapp1/view/Home/single_forum.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Home'),
      body: Consumer<MenuItemProvider>(
        builder: (context, items, child) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
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
                    child: menuItemsCard(menuItem),
                  );
                }
                return null;
              },
            ),
          );
        },
      ),
    );
  }

  Card menuItemsCard(MenuItem? menuItem) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 6,
      child: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                width: 40,
                child: Image.asset('assets/menu_icons/${menuItem?.fieldIcon}')),
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                child: Text(
                  menuItem!.fieldName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
