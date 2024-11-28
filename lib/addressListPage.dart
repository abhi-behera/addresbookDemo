import 'package:dumyapp1/addressModel.dart';
import 'package:dumyapp1/addressProviderpage.dart';
import 'package:dumyapp1/constValues.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dumyapp1/addressFormPage.dart';
import 'package:provider/provider.dart';

class AddressListPage extends StatelessWidget {
  AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Screenwidth = MediaQuery.of(context).size.width * 0.025;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses List'),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 10,
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          final addresses = addressProvider.addresses;

          if (addresses.isEmpty) {
            return const Center(
              child: Text('No addresses saved yet.'),
            );
          }

          return ListView.builder(
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return CardTile(address: address, tileIndex: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddressFormPage()));
        },
        backgroundColor: appBarColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _handleMenuAction(BuildContext context, String value, int index) {
  switch (value) {
    case 'Preference':
      // Handle "Preference" action
      preference = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Edit selected for item $index')),
      );
      break;
    case 'Edit':
      // Handle "Edit" action
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Edit selected for item $index')),
      );
      break;
    case 'Help':
      // Handle "Help" action
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Help selected for item $index')),
      );
      break;
  }
}

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.address,
    required this.tileIndex,
  });
  final Map<String, String> address;
  // final Address address;
  final int tileIndex;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      elevation: 10,
      child: ListTile(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromRGBO(104, 134, 162, 1)),
              child: Text(
                // address.addressType!,
                address['type']!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            (preference == true)
                ? SizedBox(
                    key: ValueKey(tileIndex),
                    height: 20,
                    width: 40,
                    child: Image.asset('assets/prefered.png'),
                  )
                : const Spacer(),
            SizedBox(
                height: 40,
                width: 40,
                child: PopupMenuButton<String>(
                  icon: Image.asset('assets/threeDots.png'),
                  onSelected: (value) {
                    _handleMenuAction(context, value, tileIndex);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Preference',
                      child: Text('Preference'),
                    ),
                    const PopupMenuItem(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'Help',
                      child: Text('Help'),
                    ),
                  ],
                )),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 6),
          child: Text(
            '${address['address']} , ${address['state']}, ${address['city']}',
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
