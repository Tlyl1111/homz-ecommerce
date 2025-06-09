// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:timberr/utils/app_routes.dart';

// class BottomNavBar extends StatelessWidget {
//   final int selectedPos;
//   const BottomNavBar({super.key, required this.selectedPos});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: selectedPos,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       onTap: (pos) {
//         if (pos == selectedPos) return;
//         switch (pos) {
//           case 0:
//             Get.offAllNamed(AppRoutes.home);
//             break;
//           case 1:
//             Get.offAllNamed(AppRoutes.favorite);
//             break;
//           case 2:
//             Get.offAllNamed(AppRoutes.notification);
//             break;
//           case 3:
//             Get.offAllNamed(AppRoutes.profile);
//             break;
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//           backgroundColor: Colors.red,
//           label: "home",
//           icon: SvgPicture.asset(
//             'assets/icons/home_icon.svg',
//           ),
//           activeIcon: SvgPicture.asset("assets/icons/home_selected_icon.svg"),
//         ),
//         BottomNavigationBarItem(
//           label: "favorite",
//           icon: SvgPicture.asset(
//             'assets/icons/favorite_icon.svg',
//           ),
//           activeIcon:
//               SvgPicture.asset('assets/icons/favorite_selected_icon.svg'),
//         ),
//         BottomNavigationBarItem(
//           label: "notification",
//           icon: SvgPicture.asset(
//             'assets/icons/notification_icon.svg',
//           ),
//           activeIcon:
//               SvgPicture.asset('assets/icons/notification_selected_icon.svg'),
//         ),
//         BottomNavigationBarItem(
//           label: "person",
//           icon: SvgPicture.asset(
//             'assets/icons/person_icon.svg',
//           ),
//           activeIcon: SvgPicture.asset('assets/icons/person_selected_icon.svg'),
//         ),
//       ],
//     );
//   }
// }
