import 'package:get/get.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/controllers/user_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => CardDetailsController());
  }
}