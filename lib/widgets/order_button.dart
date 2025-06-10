import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/controllers/order_controller.dart';
import 'package:timberr/models/order.dart';
import 'package:timberr/models/order_status.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/custom_outlined_button.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.order,
  });
  final Order order;

  Future<void> onTap() async {
    switch (order.status) {
      case OrderStatus.pending:
        await cancelOrder();
        break;
      case OrderStatus.pickUp:
        await trackOrder();
        break;
      case OrderStatus.shipping:
        await trackOrder();
        break;
      case OrderStatus.delivered:
        await leaveReview();
        break;
      case OrderStatus.canceled:
        await reOrder();
        break;
    }
  }

  Future<void> cancelOrder() async {
    await Supabase.instance.client.from('Orders').update(
        {'status': OrderStatus.canceled.name}).eq('order_id', order.orderId);
    await Get.find<OrderController>().refreshOrders();
  }

  Future<void> reOrder() async {
    await Supabase.instance.client.from('Orders').update(
        {'status': OrderStatus.pending.name}).eq('order_id', order.orderId);
    await Get.find<OrderController>().refreshOrders();
  }

  Future<void> trackOrder() async {
    Get.toNamed(AppRoutes.trackOrder, arguments: order);
  }

  Future<void> leaveReview() async {
    Get.toNamed(AppRoutes.reviewOrder, arguments: order);
  }

  @override
  Widget build(BuildContext context) {
    switch (order.status) {
      case OrderStatus.pending:
        return CustomOutlinedButton(
          onPressed: () => onTap(),
          child: const Text(
            "Cancel Order",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF325052),
            ),
          ),
        );
      case OrderStatus.pickUp:
        return CustomButton(
          onTap: () => onTap(),
          child: const Text("Track Order"),
        );
      case OrderStatus.shipping:
        return CustomButton(
          onTap: () => onTap(),
          child: const Text("Track Order"),
        );
      case OrderStatus.delivered:
        return CustomOutlinedButton(
          onPressed: () => onTap(),
          child: const Text(
            "Leave Review",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF325052),
            ),
          ),
        );
      case OrderStatus.canceled:
        return CustomButton(
          onTap: () => onTap(),
          child: const Text("Re-Order"),
        );
    }
  }
}
