import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/screens/input/add_shipping_screen.dart';
import 'package:timberr/widgets/cards/address_card.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  void _addOnTap() {
    Get.to(
      () => AddShippingScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
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
          "Receiver Information",
          style: TextStyle(
            fontFamily: 'popins',
            fontSize: 24,
            color: kOffBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addOnTap,
        elevation: 8,
        backgroundColor: Colors.white,
        foregroundColor: kOffBlack,
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: GetBuilder<AddressController>(builder: (addressController) {
        if (addressController.addressList.isEmpty) {
          return const Center(
            child: Text(
              "No Shipping Addresses have been entered",
              style: TextStyle(
                fontFamily: 'popins',
                fontSize: 14,
                color: kGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: addressController.addressList.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: AddressCard(
                    address: addressController.addressList[index],
                    index: index,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (addressController.selectedIndex == index) {
                      return;
                    }
                    addressController.setDefaultShippingAddress(index);
                  },
                  icon: Icon(
                    (addressController.selectedIndex == index)
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: kOffBlack,
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
