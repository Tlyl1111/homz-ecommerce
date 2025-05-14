import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_application_1/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_application_1/features/shop/screens/camera_scan_screen.dart';

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
            _navItem(Iconsax.camera, 'Scan', 2, controller),
            _navItem(Iconsax.heart, 'Favorite', 3, controller),
            _navItem(Iconsax.user, 'Profile', 4, controller),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      floatingActionButton: Obx(() => controller.selectedIndex.value == 2
          ? FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraScanScreen()),
              ),
              backgroundColor: HColors.green500,
              child: const Icon(Icons.camera_alt, color: Colors.white),
            )
          : const SizedBox()),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(
      color: Colors.orange,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 64, color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Tap the camera button to start scanning',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
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
