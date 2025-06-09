import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/models/cart_item.dart';
import 'package:timberr/models/order_status.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/cart/order_success_screen.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;
  final CartController _cartController = Get.find();
  final _supabaseClient = Supabase.instance.client;
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  Future<void> openCheckout(int orderAmount, int shippingAddressId,
      int cardDetailId, List<CartItem> cartItems) async {
    final orderId =
        _supabaseClient.auth.currentUser!.id + DateTime.now().toIso8601String();
    await _supabaseClient.from('Orders').insert({
      'order_id': orderId,
      'status': OrderStatus.pending.name,
      'user_id': _supabaseClient.auth.currentUser!.id,
      'order_date': DateTime.now().toIso8601String(),
      'total_amount': orderAmount,
      'shipping_address_id': shippingAddressId,
      'card_detail_id': cardDetailId,
      'total_quantity': cartItems.fold(0, (sum, item) => sum + item.quantity),
      'image_url': cartItems.first.imagesList.first,
      'product_name': cartItems.first.name,
      'color': colorToString(cartItems.first.color),
    });
    for (var cartItem in cartItems) {
      await _supabaseClient.from('OrderItems').insert({
        'order_id': orderId,
        'product_id': cartItem.productId,
        'quantity': cartItem.quantity,
        'color_name': colorToString(cartItem.color),
        'unit_price': cartItem.price,
        'product_name': cartItem.name,
        'image_url': cartItem.imagesList.first,
      });
    }
    _handlePaymentSuccess();
  }

  Future<void> _handlePaymentSuccess() async {
    await _cartController.removeAllFromCart();
    Get.off(
      () => const OrderSuccessScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    kDefaultDialog("Payment Failed",
        "There was an error processing your payment. Please try again after sometime");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
