import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/product_page_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/product/detail_tab.dart';
import 'package:timberr/screens/product/product_review_screen.dart';
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
  void _toProductReviewScreen() {
    Get.to(() => const ProductReviewScreen());
  }

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
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
                  // Positioned(
                  //   left: 27,
                  //   top: size.height * 0.05,
                  //   child: FadeInWidget(
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         child: const Icon(
                  //           Icons.arrow_back_ios_new,
                  //           color: kOffBlack,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                top: size.height * 0.38,
                // bottom: 100,
                child: GestureDetector(
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
                        shape: BoxShape.circle, color: Colors.white),
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
              );
            }),
            // Positioned(
            //   bottom: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            //     child: SizedBox(
            //       height: size.height * 0.45,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             product.name,
            //             style: kGelasio18.copyWith(
            //               fontSize: 24,
            //               color: kOffBlack,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //           const SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '\$ ${product.price}',
            //                 style: const TextStyle(
            //                     fontSize: 30,
            //                     fontWeight: FontWeight.bold,
            //                     color: kOffBlack),
            //               ),
            //               Row(
            //                 children: [
            //                   GestureDetector(
            //                     onTap: () {
            //                       if (_controller.quantityCounter.value > 25) {
            //                         return;
            //                       }
            //                       _controller.quantityCounter.value++;
            //                     },
            //                     child: Container(
            //                       height: 30,
            //                       width: 30,
            //                       margin: const EdgeInsets.only(right: 15),
            //                       decoration: BoxDecoration(
            //                         color: kChristmasSilver,
            //                         borderRadius: BorderRadius.circular(10),
            //                       ),
            //                       child: const Icon(
            //                         Icons.add,
            //                         color: kTinGrey,
            //                       ),
            //                     ),
            //                   ),
            //                   Obx(() {
            //                     return Text(
            //                       '${(_controller.quantityCounter.value < 10) ? '0' : ''}${_controller.quantityCounter.value}',
            //                       style: kNunitoSansSemiBold18,
            //                     );
            //                   }),
            //                   GestureDetector(
            //                     onTap: () {
            //                       if (_controller.quantityCounter.value == 1) {
            //                         return;
            //                       }
            //                       _controller.quantityCounter.value--;
            //                     },
            //                     child: Container(
            //                       height: 30,
            //                       width: 30,
            //                       margin: const EdgeInsets.only(left: 15),
            //                       decoration: BoxDecoration(
            //                         color: kChristmasSilver,
            //                         borderRadius: BorderRadius.circular(10),
            //                       ),
            //                       child: const Icon(
            //                         Icons.remove,
            //                         color: kTinGrey,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 10),
            //           GestureDetector(
            //             onTap: _toProductReviewScreen,
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 SvgPicture.asset(
            //                   'assets/icons/star_icon.svg',
            //                   height: 20,
            //                   width: 20,
            //                 ),
            //                 const SizedBox(width: 10),
            //                 const Text(
            //                   '4.5',
            //                   style: kNunitoSansSemiBold18,
            //                 ),
            //                 const SizedBox(width: 10),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 2),
            //                   child: Text(
            //                     '(50 reviews)',
            //                     style: kNunitoSans14.copyWith(
            //                       fontWeight: FontWeight.w600,
            //                       color: kGrey,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           const SizedBox(height: 10),
            //           Text(
            //             product.description,
            //             style: kNunitoSans14.copyWith(
            //               fontWeight: FontWeight.w300,
            //               color: kGraniteGrey,
            //             ),
            //           ),
            //           const SizedBox(height: 20),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Obx(
            //                 () {
            //                   int index = _favIndex();
            //                   return InkWell(
            //                     customBorder: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(16),
            //                     ),
            //                     onTap: () {
            //                       if (index == -1) {
            //                         _favoriteController.addProduct(product);
            //                       } else {
            //                         _favoriteController.removeProductAt(index);
            //                       }
            //                     },
            //                     child: Ink(
            //                       height: 60,
            //                       width: 60,
            //                       decoration: BoxDecoration(
            //                         color: kChristmasSilver,
            //                         borderRadius: BorderRadius.circular(16),
            //                       ),
            //                       child: SvgPicture.asset(
            //                         (index == -1)
            //                             ? 'assets/icons/favorite_icon_black.svg'
            //                             : 'assets/icons/favorite_selected_icon.svg',
            //                         height: 24,
            //                         width: 24,
            //                         fit: BoxFit.scaleDown,
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //               const SizedBox(width: 20),
            //               Expanded(
            //                 child: CustomElevatedButton(
            //                   onTap: _addToCart,
            //                   text: "Add to cart",
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
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
                          // indicatorColor: const Color(0xFF325052),
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
                                  // color: kOffBlack,
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
                                  // color: kOffBlack,
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
                            const Text("Reviews"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
                                fontSize: 16,
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
      ),
    );
  }
}
