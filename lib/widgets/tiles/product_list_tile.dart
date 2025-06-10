import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/categories_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final bool heroMode;
  final EdgeInsets? padding;
  final CartController _cartController = Get.find();
  final FavoritesController _favoriteController = Get.find();
  final CategoriesController _categoriesController = Get.find();
  ProductListTile(
      {super.key, required this.product, this.heroMode = true, this.padding});

  void _productOnTap() {
    Get.toNamed(
      AppRoutes.product,
      arguments: product,
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
    return Container(
      margin: padding,
      width: size.width,
      height: 150,
      child: GestureDetector(
        onTap: _productOnTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeroMode(
              enabled: heroMode,
              child: Hero(
                tag:
                    "product_${product.productId}_${product.imagesList[0]}", // Unique tag using product ID
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        cacheKey: product.imagesList[0],
                        imageUrl: product.imagesList[0],
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          if (downloadProgress.progress == null) {
                            return const SizedBox();
                          } else {
                            return Image.asset(
                              'assets/furniture_loading.gif',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                        height: 150,
                        width: 150,
                        maxHeightDiskCache: (size.height * 2).toInt(),
                        maxWidthDiskCache: (size.width * 2).toInt(),
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        int index = _favIndex();
                        return Positioned(
                          left: 12,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              if (index == -1) {
                                _favoriteController.addProduct(product);
                              } else {
                                _favoriteController.removeProductAt(index);
                              }
                            },
                            child: Image.asset(
                              index == -1
                                  ? 'assets/Heart.png'
                                  : 'assets/heart_fill.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Obx(() {
                          return _categoriesController.isLoading.value
                              ? const Text("")
                              : Text(
                                  _categoriesController.categoryList
                                      .firstWhere((element) =>
                                          element.categoryId ==
                                          product.categoryId)
                                      .name,
                                  style: const TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                );
                        }),
                        Text(
                          product.name,
                          style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$ ${product.price}.00',
                          style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 14,
                              color: Color(0xFF6E7273),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Image.asset(
                              'assets/star.png',
                              height: 12,
                              width: 12,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40,
                          child: CustomButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'assets/shopping_cart.png',
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                _cartController.addToCart(
                                    product, product.colorsList[0]);
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
