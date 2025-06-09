import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/tabbed/bottom_nav.dart';
import 'package:timberr/widgets/tiles/cart_list_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _toCheckOutScreen(int total) {
    Get.toNamed(
      AppRoutes.checkout,
      arguments: total,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(selectedPos: 2),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder<CartController>(builder: (controller) {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.cartList.isEmpty) {
              return const Center(child: Text("No Item present in the cart"));
            }
            return Column(children: [
              Expanded(
                child: ListView.separated(
                  itemCount: controller.cartList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    debugPrint(controller.cartList
                        .elementAt(index)
                        .toJson()
                        .toString());
                    return CartListTile(
                      cartItem: controller.cartList.elementAt(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sub Total",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF0E1415),
                            ),
                          ),
                          Text(
                            "\$ ${controller.total.value}.00",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF0E1415),
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      height: 48,
                      onTap: () => _toCheckOutScreen(controller.total.value),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CHECK OUT",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ]);
          }),
        ),
      ),
    );
  }
}
