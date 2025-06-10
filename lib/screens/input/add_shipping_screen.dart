import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/input/custom_dropdown_box.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class AddShippingScreen extends StatelessWidget {
  AddShippingScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AddressController _addressController = Get.find();

  void _nameOnChanged(String val) {
    _addressController.name = val;
  }

  String? _nameValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter your name";
    } else {
      return null;
    }
  }

  void _addressOnChanged(String val) {
    _addressController.address = val;
  }

  String? _addressValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter the address";
    } else {
      return null;
    }
  }

  void _pincodeOnChanged(String val) {
    _addressController.pincode = int.parse(val);
  }

  String? _pincodeValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter your pincode";
    } else if (!val!.isNum) {
      return "Please enter a valid pincode";
    } else if (val.length != 6) {
      return "Pincode must be 6 characters long";
    } else {
      return null;
    }
  }

  void _countryOnChanged(String val) {
    _addressController.country = val;
  }

  String? _countryValidator(val) {
    return (val == null) ? "Please Select the Country" : null;
  }

  void _cityOnChanged(String val) {
    _addressController.city = val;
  }

  String? _cityValidator(val) {
    return (val == null) ? "Please Select the City" : null;
  }

  void _districtOnChanged(String val) {
    _addressController.district = val;
  }

  String? _districtValidator(val) {
    return (val == null) ? "Please Select the District" : null;
  }

  void _uploadAddress() {
    if (_formKey.currentState!.validate()) {
      _addressController.uploadAddress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kOffBlack,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "ADD SHIPPING ADDRESS",
          style: TextStyle(
            fontFamily: 'popins',
            fontSize: 16,
            color: kOffBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    CustomInputBox(
                      headerText: "Full name",
                      hintText: "Ex: Aditya R",
                      textInputType: TextInputType.name,
                      onChanged: _nameOnChanged,
                      validator: _nameValidator,
                    ),
                    const SizedBox(height: 24),
                    CustomInputBox(
                      headerText: "Address",
                      hintText: "Ex: 87 Church Street",
                      textInputType: TextInputType.streetAddress,
                      onChanged: _addressOnChanged,
                      validator: _addressValidator,
                    ),
                    const SizedBox(height: 24),
                    CustomInputBox(
                      headerText: "Zipcode (Postal Code)",
                      hintText: "Ex: 600014",
                      maxLength: 6,
                      textInputAction: TextInputAction.done,
                      onChanged: _pincodeOnChanged,
                      validator: _pincodeValidator,
                    ),
                    const SizedBox(height: 24),
                    CustomDropdownBox(
                      // headerText: "Country",
                      hintText: "Select City",
                      items: const [
                        DropdownMenuItem(
                          value: "Ho Chi Minh City",
                          child: Text("Ho Chi Minh City"),
                        )
                      ],
                      onChanged: _countryOnChanged,
                      validator: _countryValidator,
                    ),
                    const SizedBox(height: 24),
                    CustomDropdownBox(
                      // headerText: "City",
                      hintText: "Select District",
                      items: const [
                        DropdownMenuItem(
                          value: "District 1",
                          child: Text("District 1"),
                        ),
                      ],
                      onChanged: _cityOnChanged,
                      validator: _cityValidator,
                    ),
                    const SizedBox(height: 24),
                    CustomDropdownBox(
                      // headerText: "District",
                      hintText: "Select Ward",
                      items: const [
                        DropdownMenuItem(
                          value: "Ward 1",
                          child: Text("Ward 1"),
                        ),
                      ],
                      onChanged: _districtOnChanged,
                      validator: _districtValidator,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          height: 50,
                          onTap: _uploadAddress,
                          child: const Text(
                            "Save Address",
                            style: TextStyle(
                              fontFamily: 'popins',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
