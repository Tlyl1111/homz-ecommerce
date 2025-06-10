import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/categories_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => CartController());
    // CategoriesController is already registered as permanent in CategoryBinding
    // Add CategoriesController with fenix:true to prevent conflicts with permanent instance
    // This ensures the controller is available but doesn't conflict with CategoryBinding
    Get.lazyPut(() => CategoriesController(), fenix: true);
  }
}
