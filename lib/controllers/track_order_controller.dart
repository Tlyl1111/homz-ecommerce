import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/order.dart';
import 'package:timberr/models/order_item.dart';

class TrackOrderController extends GetxController {
  final _supabaseInstance = Supabase.instance;
  final Order order = Get.arguments;
  var isLoading = true.obs;
  var orderItemList = <OrderItem>[].obs;

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
}
