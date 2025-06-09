import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/order.dart';
import 'package:timberr/models/order_status.dart';

class OrderController extends GetxController {
  final _supabaseInstance = Supabase.instance;
  var isLoading = true.obs;
  var pendingOrderList = <Order>[].obs;
  var cancelledOrderList = <Order>[].obs;
  var shippingOrderList = <Order>[].obs;
  var deliveredOrderList = <Order>[].obs;
  var pickUpOrderList = <Order>[].obs;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  Future<void> fetchOrders() async {
    await getOrders();
    isLoading.value = false;
    update();
  }

  Future<void> getOrders() async {
    try {
      final response = await _supabaseInstance.client.from('Orders').select();
      List responseList = response;
      debugPrint(responseList.toString());
      final orderList = responseList
          .map((orderResponse) => Order.fromJson(orderResponse))
          .toList();
      debugPrint(orderList.toString());
      pendingOrderList.value = orderList
          .where((order) => order.status == OrderStatus.pending)
          .toList();
      cancelledOrderList.value = orderList
          .where((order) => order.status == OrderStatus.canceled)
          .toList();
      shippingOrderList.value = orderList
          .where((order) => order.status == OrderStatus.shipping)
          .toList();
      deliveredOrderList.value = orderList
          .where((order) => order.status == OrderStatus.delivered)
          .toList();
      pickUpOrderList.value = orderList
          .where((order) => order.status == OrderStatus.pickUp)
          .toList();
      update();
    } catch (e) {
      debugPrint('Error loading orders: $e');
      update();
    }
  }
}
