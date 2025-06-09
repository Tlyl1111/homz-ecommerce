// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/constants.dart';
// import 'package:timberr/controllers/product_page_controller.dart';

// class ProductImageView extends StatelessWidget {
//   final List<String> imagesList;
//   final int productId;
//   final ProductPageController _controller = Get.find();
//   ProductImageView(
//       {super.key, required this.imagesList, required this.productId});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         Positioned(
//           right: 0,
//           top: 0,
//           bottom: 0,
//           child: Hero(
//             tag:
//                 "product_${productId}_${imagesList[0]}", // Unique tag matching the grid tile
//             child: ClipRRect(
//               child: SizedBox(
//                 height: size.height * 0.55,
//                 width: size.width,
//                 child: PageView(
//                   physics: const BouncingScrollPhysics(),
//                   onPageChanged: (index) {
//                     _controller.imageIndex.value = index;
//                   },
//                   children: [
//                     for (int i = 0; i < imagesList.length; i++)
//                       CachedNetworkImage(
//                         cacheKey: imagesList[i],
//                         imageUrl: imagesList[i],
//                         maxHeightDiskCache: (size.height * 2).toInt(),
//                         maxWidthDiskCache: (size.width * 2).toInt(),
//                         fit: BoxFit.cover,
//                         height: size.height * 0.55,
//                         width: size.width,
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 35,
//           bottom: 30,
//           child: Obx(
//             () => Row(
//               children: [
//                 for (int i = 0; i < imagesList.length; i++)
//                   AnimatedContainer(
//                     width: (_controller.imageIndex.value == i) ? 30 : 15,
//                     height: 4,
//                     duration: const Duration(milliseconds: 400),
//                     curve: Curves.bounceOut,
//                     margin: const EdgeInsets.only(right: 10),
//                     decoration: BoxDecoration(
//                       color: (_controller.imageIndex.value == i)
//                           ? kOffBlack
//                           : kSnowFlakeWhite,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
