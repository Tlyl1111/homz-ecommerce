import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/controllers/order_controller.dart';
import 'package:timberr/models/order.dart';
import 'package:timberr/models/order_item.dart';

class ReviewController extends GetxController {
  final _supabaseInstance = Supabase.instance;
  var starRating = 0.obs;
  var reviewText = ''.obs;
  final Order order = Get.arguments;
  var isLoading = true.obs;
  var orderItemList = <OrderItem>[].obs;
  final OrderController orderController = Get.find<OrderController>();

  @override
  void onInit() {
    fetchOrderItems();
    super.onInit();
  }

  Future<void> fetchOrderItems() async {
    await getOrderItems();
    isLoading.value = false;
    update();
  }

  Future<void> getOrderItems() async {
    try {
      final response = await _supabaseInstance.client
          .from('OrderItems')
          .select()
          .eq('order_id', order.orderId);
      List responseList = response;
      debugPrint(responseList.toString());
      orderItemList.value = responseList
          .map((orderItemResponse) => OrderItem.fromJson(orderItemResponse))
          .toList();
      debugPrint(orderItemList.toString());
      update();
    } catch (e) {
      debugPrint('Error loading track order: $e');
      update();
    }
  }

  Future<void> onSubmitReview() async {
    for (var orderItem in orderItemList) {
      await addReviewForProduct(orderItem);
    }
    await _supabaseInstance.client
        .from('Orders')
        .update({'is_reviewed': true}).eq('order_id', order.orderId);
    await orderController.refreshOrders();
  }

  Future<void> addReviewForProduct(OrderItem orderItem) async {
    try {
      await _supabaseInstance.client.from('Reviews').insert({
        'order_id': order.orderId,
        'user_id': _supabaseInstance.client.auth.currentUser!.id,
        'rating': starRating.value,
        'content': reviewText.value,
        'product_id': orderItem.productId,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      debugPrint('Error adding review: $e');
    }
  }
}
