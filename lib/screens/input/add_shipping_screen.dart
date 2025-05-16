import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
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
    } else {
      return null;
    }
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
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: kOffBlack),
        ),
        centerTitle: true,
        title: const Text("ADD SHIPPING ADDRESS"),
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
                textInputType: TextInputType.name,
                onChanged: _nameOnChanged,
                validator: _nameValidator,
              ),
              const SizedBox(height: 20),
              CustomInputBox(
                headerText: "Address",
                hintText: "Ex: 87 Church Street",
                textInputType: TextInputType.streetAddress,
                onChanged: _addressOnChanged,
                validator: _addressValidator,
              ),
              const SizedBox(height: 20),
              CustomInputBox(
                headerText: "Zipcode (Postal Code)",
                hintText: "Ex: 600014",
                maxLength: 6,
                onChanged: _pincodeOnChanged,
                validator: _pincodeValidator,
              ),
              const Spacer(),
              CustomButton(
                height: 50,
                onTap: _uploadAddress,
                child: const Text("Save Address"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}