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

  int? _preferredIndex;
  int? get preferredIndex => _preferredIndex;

  void addAddress(String address1, String address2, String type, String country,
      String state, String city, String zip) {
    _addresses.add(Address(
      address1: address1,
      address2: address2,
      city: city,
      zip: zip,
      addressType: type,
      country: country,
      state: state,
    ));
    notifyListeners();
  }

  void setPreferredIndex(int index) {
    _preferredIndex = index;
    notifyListeners();
  }
}
