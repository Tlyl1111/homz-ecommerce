import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          destinations: [
            _navItem(Iconsax.home, 'Home', 0, controller),
            _navItem(Iconsax.category, 'Cate', 1, controller),
            _navItem(Iconsax.shopping_cart, 'Cart', 2, controller),
            _navItem(Iconsax.heart, 'Favorite', 3, controller),
            _navItem(Iconsax.user, 'Profile', 4, controller),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    Container(color: Colors.pink),
  ];
}

NavigationDestination _navItem(
  IconData icon,
  String label,
  int index,
  NavigationController controller,
) {
  final isSelected = controller.selectedIndex.value == index;
  return NavigationDestination(
    icon: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
      decoration: BoxDecoration(
        color: isSelected ? HColors.green500 : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(icon, color: isSelected ? HColors.white : HColors.green500),
    ),

    label: label,
  );
}
