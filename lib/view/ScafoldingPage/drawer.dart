import 'package:dumyapp1/api_endpoints/api_endpoints.dart';
import 'package:dumyapp1/provider/user_profile_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Addressbook/address_list_page.dart';
import 'package:dumyapp1/view/MovieList/movies.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Drawer drawer(double screenWidth, BuildContext context) {
  final userProfileProvider =
      Provider.of<UserProfileProvider>(context, listen: true);

  return Drawer(
    width: screenWidth,
    backgroundColor: const Color.fromRGBO(58, 77, 137, 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Row(children: [
            Stack(children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://qaiadmin.neelsystems.com/InstituteImages/237/Public/abhijit.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (userProfileProvider.badgeStatus == "hiring")
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0,
                  left: MediaQuery.of(context).size.width * 0,
                  child: Container(
                    width: 80,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(69, 82, 108, 132)
                              .withOpacity(0.1),
                          const Color.fromARGB(255, 20, 52, 117).withOpacity(1),
                          const Color.fromARGB(255, 112, 129, 166)
                              .withOpacity(0.2),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(80),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '#HIRING',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              if (userProfileProvider.badgeStatus == "openToWork")
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0,
                  left: MediaQuery.of(context).size.width * 0,
                  child: Container(
                    width: 80,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(145, 176, 216, 174).withOpacity(0.1),
                          const Color.fromARGB(255, 97, 210, 101)
                              .withOpacity(0.8),
                          const Color.fromARGB(104, 255, 255, 255)
                              .withOpacity(0.2),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(80),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '#OpenToWork',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
            const SizedBox(width: 7),
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
          endIndent: 20,
          indent: 20,
        ),
        ListTile(
          leading: const ImageIcon(
            NetworkImage(
                "${Api.imageListApi}address-book-hand-drawn-outline.png"),
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
            Icons.video_collection,
            color: Colors.white,
          ),
          title: const Text('My Courses',
              style: TextStyle(
                color: Colors.white,
              )),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MoviesPage()));
          },
        ),
        ListTile(
          leading: const ImageIcon(
            NetworkImage("${Api.imageListApi}user.png"),
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
