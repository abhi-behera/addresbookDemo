import 'package:dumyapp1/api_endpoints/api_endpoints.dart';
import 'package:dumyapp1/provider/address_provider_page.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dumyapp1/view/Addressbook/address_form_page.dart';
import 'package:provider/provider.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Addresses List"),
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
              return CardTile(address: addressProvider, tileIndex: index);
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

void _handleMenuAction(BuildContext context, String value, int index,
    AddressProvider addProvider) {
  switch (value) {
    case 'Preference':
      // For Handling "Preference" part
      addProvider.setPreferredIndex(index);
      break;
    case 'Edit':
      // For Handling "Edit" part
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => AddressFormPage(
          editIndex: index,
          addressToEdit: addProvider.addresses[index],
        ),
      ));
      if (kDebugMode) {
        print('Edit selected for item $index');
      }

      break;
    case 'Help':
      // For Handling "Help" part
      if (kDebugMode) {
        print('Help selected for item $index');
      }
      break;
  }
}

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.address,
    required this.tileIndex,
  });
  final AddressProvider address;
  final int tileIndex;
  @override
  Widget build(BuildContext context) {
    final isPreferred = address.preferredIndex == tileIndex;

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
                address.addresses[tileIndex].addressType!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            (isPreferred)
                ? SizedBox(
                    key: ValueKey(tileIndex),
                    height: 20,
                    width: 40,
                    child: Image.network('${Api.imageListApi}prefered.png'),
                  )
                : const Spacer(),
            SizedBox(
                height: 40,
                width: 40,
                child: PopupMenuButton<String>(
                  icon: Image.network('${Api.imageListApi}threeDots.png'),
                  onSelected: (value) {
                    _handleMenuAction(context, value, tileIndex, address);
                  },
                  itemBuilder: (context) => (isPreferred)
                      ? [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'Help',
                            child: Text('Help'),
                          ),
                        ]
                      : [
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
            '${address.addresses[tileIndex].address1} , ${address.addresses[tileIndex].address2}, ${address.addresses[tileIndex].city}',
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => AddressFormPage(
              editIndex: tileIndex,
              addressToEdit: address.addresses[tileIndex],
            ),
          ));
        },
      ),
    );
  }
}
