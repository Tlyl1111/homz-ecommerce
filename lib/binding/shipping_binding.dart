import 'package:get/get.dart';
import 'package:timberr/controllers/address_controller.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}