import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/models/address.dart';
import 'package:timberr/screens/input/edit_shipping_screen.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final int index;
  final bool isEditable;
  const AddressCard(
      {super.key,
      this.isEditable = true,
      required this.address,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/location.png", height: 32, width: 32),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  address.name,
                  style: kNunitoSansBold18.copyWith(
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                Text(
                  address.displayAddress(),
                  style: kNunitoSans14.copyWith(
                    color: kGrey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
