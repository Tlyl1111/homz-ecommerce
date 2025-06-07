import 'package:get/get.dart';
import 'package:timberr/binding/auth_binding.dart';

import 'package:timberr/features/authentication/screens/register_screen.dart';
import 'package:timberr/features/authentication/screens/splash_screen.dart';

import 'package:timberr/wrapper.dart';

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

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    /*GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),*/
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    /*GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),*/
    GetPage(
      name: wrapper,
      page: () => const Wrapper(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    /*GetPage(
      name: home,
      page: () => Home(),
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
      page: () => CartScreen(),
      binding: CartBinding(),
      transition: Transition.fade,
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
      page: () => const OrdersScreen(),
      transition: Transition.cupertino,
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
    ),*/
  ];
}
