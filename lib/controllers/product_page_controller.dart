import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var imageIndex = 0.obs;
  var colorIndex = 0.obs;
  var quantityCounter = 1.obs;

  void incrementQuantity() {
    quantityCounter.value++;
    update();
  }

  void decrementQuantity() {
    if (quantityCounter.value > 1) {
      quantityCounter.value--;
      update();
    }
  }
}
