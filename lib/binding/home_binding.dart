// import 'package:get/get.dart';
// import 'package:timberr/controllers/address_controller.dart';
// import 'package:timberr/controllers/card_details_controller.dart';
// import 'package:timberr/controllers/cart_controller.dart';
// import 'package:timberr/controllers/categories_controller.dart';
// import 'package:timberr/controllers/favorites_controller.dart';
// import 'package:timberr/controllers/home_controller.dart';
// import 'package:timberr/controllers/user_controller.dart';

// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => HomeController());
//     Get.lazyPut(() => FavoritesController());
//     Get.lazyPut(() => CartController());
//     Get.lazyPut(() => UserController());
//     Get.lazyPut(() => AddressController());
//     Get.lazyPut(() => CardDetailsController());
//     // CategoriesController is already registered as permanent in CategoryBinding
//     // Add CategoriesController with fenix:true to prevent conflicts with permanent instance
//     // This ensures the controller is available but doesn't conflict with CategoryBinding
//     Get.lazyPut(() => CategoriesController(), fenix: true);
//   }
// }
