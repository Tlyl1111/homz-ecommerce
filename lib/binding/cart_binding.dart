import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
  }
}
