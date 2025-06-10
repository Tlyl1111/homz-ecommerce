import 'package:get/get.dart';
import 'package:timberr/controllers/card_details_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardDetailsController());
  }
}