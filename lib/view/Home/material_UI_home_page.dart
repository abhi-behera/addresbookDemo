import 'package:dumyapp1/api_endpoints/api_endpoints.dart';
import 'package:dumyapp1/model/menu_model.dart';
import 'package:dumyapp1/provider/menu_item_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Addressbook/address_list_page.dart';
import 'package:dumyapp1/view/Home/single_forum.dart';
import 'package:dumyapp1/view/MovieList/movies_1.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> tabNames = [
    'Abhijit Institute',
    'New Institute',
    'Old Institute'
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black54,
                    )),
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 233, 233, 237),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 58.0),
                    child: Text(
                      'Institute Design 2',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(192, 89, 100, 199),
                            Color.fromARGB(192, 149, 172, 241),
                            Color.fromARGB(192, 255, 255, 255),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                ),
                expandedHeight: 200,
                bottom: TabBar(
                  labelColor: Colors.black54,
                  indicatorColor: const Color.fromARGB(255, 44, 79, 105),
                  padding: const EdgeInsets.only(bottom: 10),
                  isScrollable: true, // Makes the TabBar scrollable
                  tabs: List.generate(
                    tabNames.length,
                    (index) => Tab(text: tabNames[index]),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Consumer<MenuItemProvider>(
                builder: (context, items, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        builder: (context) =>
                                            const SingleForumPage()),
                                  );
                                  break;
                                case MenuUtill.moviesList:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MoviesPage1()),
                                  );
                                  break;
                                case MenuUtill.userProfile:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const USerProfile()),
                                  );
                                  break;
                                case MenuUtill.addressBook:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddressListPage()),
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
                    ),
                  );
                },
              ),
              const Center(child: Text('Screen 1')),
              const Center(child: Text('Screen 2')),
            ],
          ),
        ),
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
              decoration: BoxDecoration(
                color: const Color.fromRGBO(203, 224, 241, 0.6),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(194, 209, 241, 0.522),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                      blurStyle: BlurStyle.normal),
                ],
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              height: 60,
              width: 60,
              child:
                  Image.network('${Api.imageListApi}${menuItem?.fieldIcon}')),
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
