import 'package:get/get.dart';
import 'package:timberr/controllers/user_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}