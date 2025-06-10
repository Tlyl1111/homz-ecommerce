import 'package:get/get.dart';
import 'package:timberr/controllers/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewController());
  }
}
