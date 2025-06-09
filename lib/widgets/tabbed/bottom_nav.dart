// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/utils/app_routes.dart';
// import 'package:timberr/widgets/tabbed/nav_item.dart';

// class BottomNav extends StatelessWidget {
//   final int selectedPos;
//   const BottomNav({super.key, required this.selectedPos});

//   void onTap(int pos) {
//     if (pos == selectedPos) return;
//     switch (pos) {
//       case 0:
//         Get.offAllNamed(AppRoutes.home);
//         break;
//       case 1:
//         Get.offAllNamed(AppRoutes.category);
//         break;
//       case 2:
//         Get.offAllNamed(AppRoutes.cart);
//         break;
//       case 3:
//         Get.offAllNamed(AppRoutes.favorite);
//         break;
//       case 4:
//         Get.offAllNamed(AppRoutes.profile);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: const Color(0xFFEEEEEE),
//         borderRadius: BorderRadius.circular(84),
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         NavItem(
//             onTap: () => onTap(0),
//             icon: Image.asset(
//               selectedPos == 0 ? "assets/a_nav_1.png" : "assets/nav_1.png",
//               height: 24,
//               width: 24,
//             ),
//             isActive: selectedPos == 0),
//         NavItem(
//             onTap: () => onTap(1),
//             icon: Image.asset(
//                 selectedPos == 1 ? "assets/a_nav_2.png" : "assets/nav_2.png",
//                 height: 24,
//                 width: 24),
//             isActive: selectedPos == 1),
//         NavItem(
//             onTap: () => onTap(2),
//             icon: Image.asset(
//                 selectedPos == 2 ? "assets/a_nav_3.png" : "assets/nav_3.png",
//                 height: 24,
//                 width: 24),
//             isActive: selectedPos == 2),
//         NavItem(
//             onTap: () => onTap(3),
//             icon: Image.asset(
//                 selectedPos == 3 ? "assets/a_nav_4.png" : "assets/nav_4.png",
//                 height: 24,
//                 width: 24),
//             isActive: selectedPos == 3),
//         NavItem(
//             onTap: () => onTap(4),
//             icon: Image.asset(
//                 selectedPos == 4 ? "assets/a_nav_5.png" : "assets/nav_5.png",
//                 height: 24,
//                 width: 24),
//             isActive: selectedPos == 4),
//       ]),
//     );
//   }
// }
