import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/product_page_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/product/detail_tab.dart';
import 'package:timberr/screens/product/review_tab.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/animation/fade_in_widget.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/custom_app_bar.dart';
import 'package:timberr/widgets/tabbed/color_selection_column.dart';
import 'package:timberr/widgets/tabbed/product_image_view.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  final ProductPageController _productController = Get.find();
  final FavoritesController _favoriteController = Get.find();
  final CartController _cartController = Get.find();
  ProductScreen({super.key, required this.product});

  void _addToCart() {
    _cartController.addToCart(
      product,
      product.colorsList[_productController.colorIndex.value],
      quantity: _productController.quantityCounter.value,
    );
  }

  int _favIndex() {
    for (int i = 0; i < _favoriteController.favoritesList.length; i++) {
      if (product.productId ==
          _favoriteController.favoritesList.elementAt(i).productId) return i;
    }
    return -1;
  }

  void _shareProduct(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 320,
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white),
              child: Center(
                child: QrImageView(
                  padding: EdgeInsets.zero,
                  data: product.productId.toString(),
                  version: QrVersions.auto,
                  size: 320,
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(
      () {
        return _productController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height * 0.55,
                      child: Stack(
                        children: [
                          ProductImageView(
                            imagesList: product.imagesList,
                            productId: product.productId,
                          ),
                          CustomAppBar(
                            action: GestureDetector(
                              onTap: () {
                                Get.offNamed(AppRoutes.cart);
                              },
                              child: Image.asset(
                                'assets/cart_button.png',
                                height: 48,
                                width: 48,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: size.height * 0.25,
                            child: FadeInWidget(
                              child: ColorSelectionColumn(
                                colorsList: product.colorsList,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      int index = _favIndex();
                      return Positioned(
                        right: 20,
                        top: size.height * 0.3,
                        // bottom: 100,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => _shareProduct(context),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.share,
                                  color: Color(0xFF325052),
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                if (index == -1) {
                                  _favoriteController.addProduct(product);
                                } else {
                                  _favoriteController.removeProductAt(index);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Image.asset(
                                  index == -1
                                      ? 'assets/Heart.png'
                                      : 'assets/heart_fill.png',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: size.height * 0.55,
                        width: size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          color: Colors.white,
                        ),
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFFEEEEEE),
                                ),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF325052),
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: kOffBlack,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Reviews",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    DetailTab(product: product),
                                    ReviewTab(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 40),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Total price:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "\$${product.price * _productController.quantityCounter.value}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 48,
                              child: CustomButton(
                                onTap: _addToCart,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      "assets/shopping_cart.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    ));
  }
}
