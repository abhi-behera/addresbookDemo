import 'package:dumyapp1/addressModel.dart';
import 'package:dumyapp1/constValues.dart';
import 'package:flutter/foundation.dart';

class AddressProvider with ChangeNotifier {
  //List of map used code...
  // final List<Map<String, String>> _addresses = [];

  // List<Map<String, String>> get addresses => List.unmodifiable(_addresses);

  // List of address model code used...

  final List<Address> _addresses = [];

  List<Address> get addresses => List.unmodifiable(_addresses);

  // final List<Address> _addresses = [];
  // Address addressObj = Address();
  // List<Address> get addresses => List.unmodifiable(_addresses);

  // List<Address> get addres => addres;

  // List<Address> addres = [];

  // List<Address> get getAddress {
  //   return addres;
  // }

  // Future adddAddress(Address adr) async {}

  void addAddress(
    String address1,
    String address2,
    String type,
    String country,
    String state,
    String city,
    String zip,
  ) {
    // addressObj.address1 = address1;
    // addressObj.address2 = address2;
    // addressObj.addressType = type;
    // addressObj.country = country;
    // addressObj.state = state;
    // addressObj.city = city;
    // addressObj.zip = zip;

    _addresses.add(Address(
      address1: address1,
      address2: address2,
      city: city,
      zip: zip,
      addressType: type,
      country: country,
      state: state,
    ));

    // _addresses.add({
    //   'address': address1,
    //   'type': type,
    //   'country': country,
    //   'state': state,
    // });

    notifyListeners();
  }
}
