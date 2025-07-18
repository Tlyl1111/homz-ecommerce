import 'package:get/get.dart';
import 'package:timberr/controllers/track_order_controller.dart';

class TrackOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}
