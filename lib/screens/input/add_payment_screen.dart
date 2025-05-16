import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final CardDetailsController _cardController = Get.find();

  void _cardHolderNameOnChanged(String val) {
    _cardController.cardHolderName = val;
  }

  String? _cardHolderNameValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter cardholder name";
    } else {
      return null;
    }
  }

  void _cardNumberOnChanged(String val) {
    _cardController.cardNumber = val;
  }

  String? _cardNumberValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter card number";
    } else if (val!.length != 16) {
      return "Card number must be 16 digits";
    } else {
      return null;
    }
  }

  void _expiryDateOnChanged(String val) {
    _cardController.expiryDate = val;
  }

  String? _expiryDateValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter expiry date";
    } else if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(val!)) {
      return "Please enter valid date (MM/YY)";
    } else {
      return null;
    }
  }

  void _cvvOnChanged(String val) {
    _cardController.cvv = val;
  }

  String? _cvvValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return "Please enter CVV";
    } else if (val!.length != 3) {
      return "CVV must be 3 digits";
    } else {
      return null;
    }
  }

  void _addCard() {
    if (_formKey.currentState!.validate()) {
      _cardController.addCard();
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
          "ADD PAYMENT METHOD",
          style: kMerriweatherBold16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputBox(
                headerText: "Cardholder Name",
                hintText: "Ex: John Doe",
                textInputType: TextInputType.name,
                onChanged: _cardHolderNameOnChanged,
                validator: _cardHolderNameValidator,
              ),
              const SizedBox(height: 24),
              CustomInputBox(
                headerText: "Card Number",
                hintText: "1234 5678 9012 3456",
                textInputType: TextInputType.number,
                maxLength: 16,
                onChanged: _cardNumberOnChanged,
                validator: _cardNumberValidator,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomInputBox(
                      headerText: "Expiry Date",
                      hintText: "MM/YY",
                      textInputType: TextInputType.datetime,
                      maxLength: 5,
                      onChanged: _expiryDateOnChanged,
                      validator: _expiryDateValidator,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomInputBox(
                      headerText: "CVV",
                      hintText: "123",
                      textInputType: TextInputType.number,
                      maxLength: 3,
                      onChanged: _cvvOnChanged,
                      validator: _cvvValidator,
                    ),
                  ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: CustomInputBox(
                        headerText: "Expiration Date",
                        hintText: "Ex: 04/22",
                        maxLength: 5,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [DateFormatter()],
                        onChanged: _dateOnChanged,
                        validator: _dateValidator,
                      ),
                    ),
                ],
              ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                onTap: _addCard,
                  text: "ADD NEW CARD",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}