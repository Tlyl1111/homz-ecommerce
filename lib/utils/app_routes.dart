import 'package:get/get.dart';
import 'package:timberr/binding/auth_binding.dart';
import 'package:timberr/binding/cart_binding.dart';
import 'package:timberr/binding/category_blinding.dart';
import 'package:timberr/binding/checkout_binding.dart';
import 'package:timberr/binding/detail_category_binding.dart';
import 'package:timberr/binding/favorite_binding.dart';
import 'package:timberr/binding/home_binding.dart';
import 'package:timberr/binding/notification_binding.dart';
import 'package:timberr/binding/order_binding.dart';
import 'package:timberr/binding/payment_binding.dart';
import 'package:timberr/binding/product_binding.dart';
import 'package:timberr/binding/profile_binding.dart';
import 'package:timberr/binding/review_binding.dart';
import 'package:timberr/binding/shipping_binding.dart';
import 'package:timberr/binding/track_order_binding.dart';
import 'package:timberr/models/category.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/authentication/forgot_password_screen.dart';
import 'package:timberr/screens/authentication/register_screen.dart';
import 'package:timberr/screens/authentication/splash_screen.dart';
import 'package:timberr/screens/cart/cart_screen.dart';
import 'package:timberr/screens/cart/check_out_screen.dart';
import 'package:timberr/screens/cart/order_success_screen.dart';
import 'package:timberr/screens/category/category_screen.dart';
import 'package:timberr/screens/category/detail_category_screen.dart';
import 'package:timberr/screens/favorite_screen.dart';
import 'package:timberr/screens/home.dart';
import 'package:timberr/screens/input/add_payment_screen.dart';
import 'package:timberr/screens/input/add_shipping_screen.dart';
import 'package:timberr/screens/input/edit_shipping_screen.dart';
import 'package:timberr/screens/notification_screen.dart';
import 'package:timberr/screens/product/product_screen.dart';
import 'package:timberr/screens/profile/my_reviews_screen.dart';
import 'package:timberr/screens/profile/orders_screen.dart';
import 'package:timberr/screens/profile/payment_methods_screen.dart';
import 'package:timberr/screens/profile/profile_screen.dart';
import 'package:timberr/screens/profile/review_order_screen.dart';
import 'package:timberr/screens/profile/settings_screen.dart';
import 'package:timberr/screens/profile/shipping_address_screen.dart';
import 'package:timberr/screens/profile/track_order_screen.dart';
import 'package:timberr/screens/qr_screen.dart';
import 'package:timberr/wrapper.dart';

import '../screens/authentication/login_screen.dart';

class AppRoutes {
  static const String initialRoute = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String wrapper = '/wrapper';
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String notification = '/notification';
  static const String profile = '/profile';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orderSuccess = '/orderSuccess';
  static const String shippingAddress = '/shippingAddress';
  static const String addShipping = '/addShipping';
  static const String editShipping = '/editShipping';
  static const String paymentMethods = '/paymentMethods';
  static const String addPayment = '/addPayment';
  static const String orders = '/orders';
  static const String myReviews = '/myReviews';
  static const String settings = '/settings';
  static const String category = '/category';
  static const String detailCategory = '/detailCategory';
  static const String trackOrder = '/trackOrder';
  static const String reviewOrder = '/reviewOrder';
  static const String qr = '/qr';

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: wrapper,
      page: () => const Wrapper(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: home,
      page: () => const Home(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: qr,
      page: () => const QRScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: favorite,
      page: () => FavoriteScreen(),
      binding: FavoriteBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: notification,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: product,
      page: () {
        final Product product = Get.arguments;
        return ProductScreen(product: product);
      },
      binding: ProductBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: category,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: detailCategory,
      page: () {
        final Category category = Get.arguments;
        return DetailCategoryScreen(category: category);
      },
      binding: DetailCategoryBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: trackOrder,
      page: () {
        return const TrackOrderScreen();
      },
      binding: TrackOrderBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: reviewOrder,
      page: () {
        return const ReviewOrderScreen();
      },
      binding: ReviewBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: checkout,
      page: () {
        final int orderAmount = Get.arguments;
        return CheckOutScreen(orderAmount: orderAmount);
      },
      binding: CheckoutBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: orderSuccess,
      page: () => const OrderSuccessScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: shippingAddress,
      page: () => const ShippingAddressScreen(),
      binding: ShippingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: addShipping,
      page: () => AddShippingScreen(),
      binding: ShippingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: editShipping,
      page: () {
        final Map<String, dynamic> args = Get.arguments;
        return EditShippingScreen(
          initialAddress: args['address'],
          index: args['index'],
        );
      },
      binding: ShippingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: paymentMethods,
      page: () => PaymentMethodsScreen(),
      binding: PaymentBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: addPayment,
      page: () => AddPaymentScreen(),
      binding: PaymentBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: orders,
      page: () => OrdersScreen(),
      transition: Transition.cupertino,
      binding: OrderBinding(),
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: myReviews,
      page: () => const MyReviewsScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: settings,
      page: () => SettingsScreen(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
  ];
}
