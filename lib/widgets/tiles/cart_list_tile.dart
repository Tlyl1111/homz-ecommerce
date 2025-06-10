import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/models/cart_item.dart';
import 'package:timberr/utils/app_routes.dart';

class CartListTile extends StatelessWidget {
  final CartItem cartItem;
  final CartController _controller = Get.find();
  CartListTile({super.key, required this.cartItem});

  void _productOnTap() {
    Get.toNamed(
      AppRoutes.product,
      arguments: cartItem.getProduct(),
    );
  }

  void _removeFromCart() async {
    await _controller.removeFromCart(cartItem);
  }

  void _incrementQuantity() {
    _controller.incrementQuantity(cartItem);
  }

  void _decrementQuantity() {
    _controller.decrementQuantity(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _removeFromCart();
            },
            backgroundColor: const Color(0xFFFED3DC),
            foregroundColor: const Color(0xFFFB5075),
            icon: Icons.remove_circle_outline,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ],
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _productOnTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Hero(
                  tag: cartItem.imagesList[0],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      cacheKey: cartItem.imagesList[0],
                      imageUrl: cartItem.imagesList[0],
                      placeholder: (context, url) {
                        return Image.asset(
                          'assets/furniture_loading.gif',
                          height: 500,
                          width: 500,
                          fit: BoxFit.cover,
                        );
                      },
                      height: 100,
                      width: 100,
                      maxHeightDiskCache: (size.height * 2).toInt(),
                      maxWidthDiskCache: (size.width * 2).toInt(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.name,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '\$ ${cartItem.price}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF6E7273),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: cartItem.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(cartItem.colorToString(cartItem.color))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: _decrementQuantity,
                          child: Image.asset(
                            "assets/minus-circle.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        GetBuilder<CartController>(builder: (controller) {
                          return Container(
                            height: 24,
                            width: 46,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD6DCDC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "${cartItem.quantity}",
                                style: const TextStyle(
                                  color: kOffBlack,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }),
                        GestureDetector(
                          onTap: _incrementQuantity,
                          child: Image.asset(
                            "assets/plus-circle.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
