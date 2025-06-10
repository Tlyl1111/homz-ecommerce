import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/product_page_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductPageController());

    if (!Get.isRegistered<FavoritesController>()) {
      Get.lazyPut(() => FavoritesController());
    }

    if (!Get.isRegistered<CartController>()) {
      Get.lazyPut(() => CartController());
    }
  }
}
