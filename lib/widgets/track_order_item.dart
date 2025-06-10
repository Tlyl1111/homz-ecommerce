import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/models/order_item.dart';
import 'package:timberr/models/product.dart';

class TrackOrderItem extends StatelessWidget {
  final OrderItem orderItem;
  const TrackOrderItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                cacheKey: orderItem.imageUrl,
                imageUrl: orderItem.imageUrl,
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
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderItem.productName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$ ${orderItem.unitPrice}',
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
                                color: orderItem.colorName
                                    .colorFromString(orderItem.colorName),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(orderItem.colorName)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 24,
                  width: 46,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6DCDC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "${orderItem.quantity}",
                      style: const TextStyle(
                        color: kOffBlack,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
