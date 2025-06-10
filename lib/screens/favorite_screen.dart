import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/widgets/tabbed/bottom_nav.dart';
import 'package:timberr/widgets/tiles/product_list_tile.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final FavoritesController _favoritesController = Get.find();
  // final CartController _cartController = Get.find();
  // void _onCartTap() {
  //   Get.to(
  //     () => CartScreen(),
  //     transition: Transition.fade,
  //   );
  // }

  // void _addAllToCart() async {
  //   for (int i = 0; i < _favoritesController.favoritesList.length; i++) {
  //     await _cartController.addToCart(
  //         _favoritesController.favoritesList.elementAt(i),
  //         _favoritesController.favoritesList.elementAt(i).colorsList[0],
  //         showSnackbar: false);
  //   }
  //   Get.snackbar(
  //     "Added to Cart",
  //     "All the favorite items have been added to the cart",
  //     onTap: (_) {
  //       Get.closeCurrentSnackbar();
  //       Get.to(
  //         () => CartScreen(),
  //         transition: Transition.fadeIn,
  //         duration: const Duration(milliseconds: 600),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => kOnExitConfirmation(),
      child: Scaffold(
        bottomNavigationBar: const BottomNav(selectedPos: 3),
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Obx(() {
            if (_favoritesController.favoritesList.isEmpty) {
              return const Center(
                child: Text("No Product added to favorites List"),
              );
            } else {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _favoritesController.favoritesList.length + 1,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Text(
                      "Favorite List",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    );
                  } else {
                    return ProductListTile(
                      product: _favoritesController.favoritesList
                          .elementAt(index - 1),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
