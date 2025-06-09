// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/constants.dart';
// import 'package:timberr/controllers/categories_controller.dart';
// import 'package:timberr/widgets/buttons/category_button.dart';

// class CategoryTabBar extends StatelessWidget {
//   const CategoryTabBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: GetBuilder<CategoriesController>(
//         id: kCategories,
//         builder: (controller) {
//           return Row(
//             children: [
//               for (int i = 0; i < controller.categoryList.length; i++)
//                 CategoryButton(
//                   name: controller.categoryList[i].name,
//                   iconPath: controller.categoryList[i].iconPath,
//                   isSelected: true,
//                   onTap: () {
//                     // controller.changeSelectedCategory(i);
//                   },
//                 )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
