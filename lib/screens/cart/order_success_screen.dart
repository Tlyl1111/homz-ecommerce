import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/screens/profile/orders_screen.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  void _offToHome() {
    Get.back();
    Get.back();
  }

  void _offToOrderScreen() {
    Get.back();
    Get.back();
    Get.to(
      () => OrdersScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => kOnExitConfirmation(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  "Payment Successful!",
                  style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Thanks for shopping with us",
                  style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                CustomButton(
                  height: 54,
                  onTap: _offToHome,
                  child: const Text(
                    "Continue to Shopping",
                    style: TextStyle(
                      fontFamily: 'popins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
