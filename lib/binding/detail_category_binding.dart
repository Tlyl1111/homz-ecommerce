import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/detail_category_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';

class DetailCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailCategoryController());
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => CartController());
  }
}
