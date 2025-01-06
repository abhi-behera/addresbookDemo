import 'package:dumyapp1/model/addressbook/address_model.dart';
import 'package:dumyapp1/provider/address_provider_page.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressFormPage extends StatefulWidget {
  final GlobalKey<FormState> _formKey1 = GlobalKey();
  final int? editIndex;
  final Address? addressToEdit;

  AddressFormPage({this.editIndex, this.addressToEdit, super.key});

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

class AddressFormPageState extends State<AddressFormPage> {
  final TextEditingController _addrrss1Controller = TextEditingController();
  final TextEditingController _addrrss2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
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
  void initState() {
    super.initState();
    if (widget.addressToEdit != null) {
      _addrrss1Controller.text = widget.addressToEdit!.address1!;
      _addrrss2Controller.text = widget.addressToEdit!.address2!;
      _cityController.text = widget.addressToEdit!.city!;
      _zipController.text = widget.addressToEdit!.zip!;
      _selectedAddressType = widget.addressToEdit!.addressType!;
      _selectedCountry = widget.addressToEdit!.country!;
      _selectedState = widget.addressToEdit!.state!;
    }
  }

  @override
  void dispose() {
    _addrrss1Controller.dispose();
    _addrrss2Controller.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context, listen: true);

    void saveAddress() {
      if (widget._formKey1.currentState!.validate()) {
        widget._formKey1.currentState!.save();
        if (_addrrss1Controller.text.isNotEmpty) {
          if (widget.editIndex != null) {
            addressProvider.updateAddress(
              widget.editIndex!,
              Address(
                address1: _addrrss1Controller.text,
                address2: _addrrss2Controller.text,
                addressType: _selectedAddressType,
                country: _selectedCountry,
                state: _selectedState,
                city: _cityController.text,
                zip: _zipController.text,
              ),
            );
          } else {
            addressProvider.addAddress(
              _addrrss1Controller.text,
              _addrrss2Controller.text,
              _selectedAddressType,
              _selectedCountry,
              _selectedState,
              _cityController.text,
              _zipController.text,
            );
          }
          Navigator.pop(context);
        }
      }
    }

    double screenWidth = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      appBar: customAppBar('Add Address'),
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
                    width: screenWidth,
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
                    width: screenWidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _addrrss1Controller,
                      decoration: InputDecoration(
                        hintText: 'Enter the Address Line 1',
                        suffixIcon: IconButton(
                          onPressed: _addrrss1Controller.clear,
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
                    width: screenWidth,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _addrrss2Controller,
                      decoration: InputDecoration(
                        hintText: 'Enter the Address Line 2',
                        suffixIcon: IconButton(
                          onPressed: _addrrss2Controller.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        labelText: 'Address Line 2',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  // dropdown
                  Container(
                    width: screenWidth,
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
                    width: screenWidth,
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
                    width: screenWidth,
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
                    ),
                  ),
                  Container(
                    width: screenWidth,
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
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appBarColor),
                      onPressed: saveAddress,
                      child: const Text('Save'),
                    ),
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
