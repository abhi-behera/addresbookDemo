import 'dart:math';

import 'package:dumyapp1/addressListPage.dart';
import 'package:dumyapp1/addressProviderpage.dart';
import 'package:dumyapp1/constValues.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressFormPage extends StatefulWidget {
  final GlobalKey<FormState> _formKey1 = GlobalKey();

  @override
  _AddressFormPageState createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  var Screenwidth;
  final TextEditingController addrrss1Controller = TextEditingController();
  final TextEditingController addrrss2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  // final List<Map<String, String>> _addresses = [];
  String _selectedAddressType = 'Home';
  String _selectedCountry = 'India';
  String _selectedState = 'Delhi';

  final List<String> _addressTypes = ['Billing', 'Home', 'Office', 'Other'];
  final List<String> _countries = ['USA', 'Canada', 'India'];
  final Map<String, List<String>> _states = {
    'USA': ['California', 'Texas', 'New York'],
    'Canada': ['Ontario', 'Quebec', 'British Columbia'],
    'India': ['Maharashtra', 'Karnataka', 'Delhi', 'Odisha'],
  };

  @override
  void dispose() {
    addrrss1Controller.dispose();
    addrrss2Controller.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  clearText(TextEditingController controler) {
    if (kDebugMode) {
      print("clear text called ");
    }
    controler.clear();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context, listen: true);

    void saveAddress() {
      if (widget._formKey1.currentState!.validate()) {
        widget._formKey1.currentState!.save();
        if (addrrss1Controller.text.isNotEmpty) {
          addressProvider.addAddress(
              addrrss1Controller.text,
              addrrss2Controller.text,
              _selectedAddressType,
              _selectedCountry,
              _selectedState,
              _cityController.text,
              _zipController.text);
          if (kDebugMode) {
            print("address: ${addressProvider.addresses}");
          }
          Navigator.pop(context);
        }
      }
    }

    Screenwidth = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: widget._formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    // dropdown
                    child: DropdownButtonFormField<String>(
                      value: _selectedAddressType,
                      decoration: const InputDecoration(
                        labelText: 'Address Type',
                        border: OutlineInputBorder(),
                      ),
                      items: _addressTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedAddressType = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: addrrss1Controller,
                      decoration: InputDecoration(
                        hintText: 'Enter the Address Line 1',
                        suffixIcon: IconButton(
                          onPressed: addrrss1Controller.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: 'Address Line 1',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please  enter Address line 1';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: addrrss2Controller,
                      decoration: InputDecoration(
                        hintText: 'Enter the Address Line 2',
                        suffixIcon: IconButton(
                          onPressed: addrrss2Controller.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: 'Address Line 2',
                        border: const OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter Address line 2';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  // dropdown

                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      decoration: const InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(),
                      ),
                      items: _countries.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value!;
                          _selectedState = _states[_selectedCountry]![0];
                        });
                      },
                    ),
                  ),
                  // dropdown

                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField<String>(
                      value: _selectedState,
                      decoration: const InputDecoration(
                        labelText: 'State',
                        border: OutlineInputBorder(),
                      ),
                      items: _states[_selectedCountry]!.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        hintText: 'Enter the city name',
                        suffixIcon: IconButton(
                          onPressed: _cityController.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: 'City',
                        border: const OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your city';
                      //   }
                      //   if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      //     return 'Please enter a valid city Name(a-z or A-Z)';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Container(
                    width: Screenwidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      maxLength: 6,
                      controller: _zipController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Zip code',
                        suffixIcon: IconButton(
                          onPressed: _zipController.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: 'Zip Code',
                        border: const OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   // if (value == null || value.isEmpty) {
                      //   //   return 'Please enter your pin code';
                      //   // }
                      //   if (value != null) {
                      //     if (!RegExp(r'^[ 0-9]+$').hasMatch(value)) {
                      //       return 'Please enter valid Zip code';
                      //     }
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: appBarColor),
                    onPressed: saveAddress,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
