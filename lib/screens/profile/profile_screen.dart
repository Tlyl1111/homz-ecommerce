import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/controllers/user_controller.dart';
import 'package:timberr/screens/profile/my_reviews_screen.dart';
import 'package:timberr/screens/profile/payment_methods_screen.dart';
import 'package:timberr/screens/profile/settings_screen.dart';
import 'package:timberr/screens/profile/shipping_address_screen.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/tabbed/bottom_nav.dart';
import 'package:timberr/widgets/tiles/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UserController _userController = Get.find();
  final CardDetailsController _cardDetailsController = Get.find();
  void _toSettingsScreen() {
    Get.to(
      () => SettingsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toPaymentMethodsScreen() {
    Get.to(
      () => PaymentMethodsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toShippingAddressScreen() {
    Get.to(
      () => const ShippingAddressScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toOrdersScreen() {
    Get.toNamed(AppRoutes.orders);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => kOnExitConfirmation(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _userController.uploadProfilePicture();
            },
            icon: const Icon(
              Icons.add_a_photo,
              color: kGraniteGrey,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "PROFILE",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kOffBlack,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _userController.signOut();
              },
              icon: SvgPicture.asset(
                "assets/icons/logout_icon.svg",
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNav(selectedPos: 4),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              GetBuilder<UserController>(builder: (controller) {
                return Row(
                  children: [
                    (controller.userData.profilePictureUrl == null)
                        ? const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            foregroundImage:
                                AssetImage("assets/default_avatar.png"),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            foregroundImage: CachedNetworkImageProvider(
                              controller.userData.profilePictureUrl!,
                              maxHeight: 240,
                              maxWidth: 240,
                            ),
                          ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userData.name,
                          style: kNunitoSansBold20,
                        ),
                        Text(
                          controller.userData.email,
                          style: kNunitoSans14.copyWith(
                            color: kGrey,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
              const Spacer(flex: 2),
              ProfileTile(
                name: "My Orders",
                description: "Already have orders",
                onTap: _toOrdersScreen,
              ),
              const Spacer(),
              GetBuilder<AddressController>(
                builder: (addressController) {
                  String addressCount =
                      addressController.addressList.length.toString();
                  if (addressCount != '0' && addressCount.length == 1) {
                    addressCount = '0$addressCount';
                  }
                  return ProfileTile(
                    name: "Shipping Addresses",
                    description: "$addressCount Addresses",
                    onTap: _toShippingAddressScreen,
                  );
                },
              ),
              const Spacer(),
              Obx(() {
                return ProfileTile(
                  name: "Payment Method",
                  description:
                      "You have ${_cardDetailsController.cardDetailList.length} cards",
                  onTap: _toPaymentMethodsScreen,
                );
              }),
              const Spacer(),
              ProfileTile(
                name: "Setting",
                description: "Notification, Password, FAQ, Contact",
                onTap: _toSettingsScreen,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
