import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/categories_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/utils/app_routes.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  final bool heroMode;
  final CartController _cartController = Get.find();
  final FavoritesController _favoriteController = Get.find();
  final CategoriesController _categoriesController = Get.find();
  ProductGridTile({super.key, required this.product, this.heroMode = true});

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
    return GestureDetector(
      onTap: _productOnTap,
      child: SizedBox(
        width: size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: HeroMode(
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
                                height: 500,
                                width: 500,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                          height: 500,
                          width: 500,
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
            ),
            Row(
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
                        maxLines: 2,
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
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _cartController.addToCart(product, product.colorsList[0]);
                    },
                    child: Image.asset('assets/add_cart.png',
                        height: 28, width: 28, fit: BoxFit.contain),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
