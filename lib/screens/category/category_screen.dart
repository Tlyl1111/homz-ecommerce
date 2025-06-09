// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/controllers/categories_controller.dart';
// import 'package:timberr/utils/app_routes.dart';
// import 'package:timberr/widgets/category_item.dart';
// import 'package:timberr/widgets/tabbed/bottom_nav.dart';

// class CategoryScreen extends StatelessWidget {
//   CategoryScreen({super.key});
//   final CategoriesController controller = Get.find<CategoriesController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const BottomNav(
//         selectedPos: 1,
//       ),
//       body: SafeArea(
//           child: Obx(
//         () => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: controller.isLoading.value
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Categories",
//                       style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Wrap(
//                       spacing: 16,
//                       runSpacing: 16,
//                       direction: Axis.horizontal,
//                       children: controller.categoryList
//                           .map((category) => CategoryItem(
//                                 category: category,
//                                 onTap: () => Get.toNamed(
//                                   AppRoutes.detailCategory,
//                                   arguments: category,
//                                 ),
//                               ))
//                           .toList(),
//                     )
//                   ],
//                 ),
//         ),
//       )),
//     );
//   }
// }
