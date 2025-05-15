import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/models/address.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class EditShippingScreen extends StatelessWidget {
  final Address initialAddress;
  final int index;
  final _formKey = GlobalKey<FormState>();
  final AddressController _addressController = Get.find();

  EditShippingScreen(
      {super.key, required this.initialAddress, required this.index}) {
    _addressController.name = initialAddress.name;
    _addressController.address = initialAddress.address;
    _addressController.pincode = initialAddress.pincode;
  }

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

  void _editAddress() {
    if (_formKey.currentState!.validate()) {
      _addressController.editAddress(index, initialAddress.id);
    }
  }

  void _deleteAddress() {
    _addressController.deleteAddress(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: kOffBlack),
        ),
        centerTitle: true,
        title: const Text("EDIT SHIPPING ADDRESS", style: kMerriweatherBold16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputBox(
                headerText: "Full name",
                hintText: "Ex: Aditya R",
                initialValue: initialAddress.name,
                onChanged: _nameOnChanged,
                validator: _nameValidator,
              ),
              const SizedBox(height: 20),
              CustomInputBox(
                headerText: "Address",
                hintText: "Ex: 87 Church Street",
                initialValue: initialAddress.address,
                onChanged: _addressOnChanged,
                validator: _addressValidator,
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                onTap: _editAddress,
                text: "EDIT ADDRESS",
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: _deleteAddress,
                child: const Text("DELETE", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}