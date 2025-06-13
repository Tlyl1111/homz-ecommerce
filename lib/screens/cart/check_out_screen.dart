import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/payment_controller.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/cards/address_card.dart';
import 'package:timberr/widgets/tiles/cart_list_tile.dart';

class CheckOutScreen extends StatelessWidget {
  final int orderAmount;
  CheckOutScreen({super.key, required this.orderAmount});
  final cartController = Get.find<CartController>();
  void _toShippingAddressScreen() {
    Get.toNamed(AppRoutes.shippingAddress);
  }

  void _toPaymentMethodsScreen() {
    Get.toNamed(AppRoutes.paymentMethods);
  }

  void _openCheckout() {
    final addressController = Get.find<AddressController>();
    final cardController = Get.find<CardDetailsController>();

    if (addressController.addressList.isEmpty) {
      kDefaultDialog("No Address Added", "Please add an address to proceed");
      return;
    }
    if (cardController.cardDetailList.isEmpty) {
      kDefaultDialog("No Card Added", "Please add a Card to proceed");
      return;
    }

    Get.find<PaymentController>().openCheckout(
        orderAmount,
        addressController.addressList[addressController.selectedIndex].id,
        cardController.cardDetailList[cardController.selectedIndex.value].id,
        cartController.cartList.toList());
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
          "Check out",
          style: TextStyle(
            fontFamily: 'popins',
            fontSize: 20,
            color: kOffBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Information",
                  style: TextStyle(
                    fontFamily: 'popins',
                    fontSize: 16,
                    color: kTinGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: _toShippingAddressScreen,
                  child: const Text(
                    "Change",
                    style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 12,
                      color: Color(0xFF325052),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            GetBuilder<AddressController>(
              builder: (addressController) {
                if (addressController.addressList.isNotEmpty) {
                  return AddressCard(
                    isEditable: false,
                    address: addressController
                        .addressList[addressController.selectedIndex],
                    index: addressController.selectedIndex,
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Shipping Addresses have been entered",
                      style: kNunitoSans14.copyWith(
                        color: kGrey,
                      ),
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payment",
                  style: TextStyle(
                    fontFamily: 'popins',
                    fontSize: 16,
                    color: kTinGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: _toPaymentMethodsScreen,
                  child: const Text(
                    "Change",
                    style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 12,
                      color: Color(0xFF325052),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              return Container(
                height: 69,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 38,
                      width: 64,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x20000000),
                            offset: Offset(0, 1),
                            blurRadius: 25,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/mastercard_bw.svg',
                        height: 25,
                        width: 32,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      "**** **** **** ${Get.find<CardDetailsController>().getLastFourDigits()}",
                      style: kNunitoSans14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kRaisinBlack,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery method",
                  style: TextStyle(
                    fontFamily: 'popins',
                    fontSize: 16,
                    color: kTinGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              height: 54,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Image.asset("assets/dhl.png"),
                  const SizedBox(width: 15),
                  Text(
                    "Fast (2-3 days)",
                    style: kNunitoSans14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Order List",
              style: TextStyle(
                fontFamily: 'popins',
                fontSize: 16,
                color: kTinGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Obx(() {
              return Expanded(
                flex: 4,
                child: ListView.separated(
                  itemCount: Get.find<CartController>().cartList.length,
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    debugPrint(Get.find<CartController>()
                        .cartList
                        .elementAt(index)
                        .toJson()
                        .toString());
                    return CartListTile(
                      cartItem:
                          Get.find<CartController>().cartList.elementAt(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                ),
              );
            }),
            const Spacer(flex: 2),
            Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sub Total",
                        style: TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9FA1A1)),
                      ),
                      Text(
                        "\$ ${Get.find<CartController>().total.value}.00",
                        style: const TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9FA1A1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9FA1A1)),
                      ),
                      Text(
                        "\$ 5.00",
                        style: TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9FA1A1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total cost",
                        style: TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "\$ ${Get.find<CartController>().total.value + 5}.00",
                        style: const TextStyle(
                            fontFamily: 'popins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              );
            }),
            const Spacer(),
            CustomButton(
              height: 48,
              onTap: _openCheckout,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
