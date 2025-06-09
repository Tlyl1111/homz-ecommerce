import 'package:timberr/models/order_status.dart';

class Order {
  final String orderId;
  final String userId;
  final DateTime orderDate;
  final int totalQuantity;
  final double totalAmount;
  final OrderStatus status;
  final int shippingAddressId;
  final String imageUrl;
  final String productName;
  final String color;

  Order({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.totalQuantity,
    required this.totalAmount,
    required this.status,
    required this.shippingAddressId,
    required this.imageUrl,
    required this.productName,
    required this.color,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      userId: json['user_id'],
      orderDate: json['order_date'] != null
          ? DateTime.parse(json['order_date'])
          : DateTime.now(),
      totalQuantity: json['total_quantity'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      totalAmount: json['total_amount']?.toDouble() ?? 0.0,
      status: OrderStatusExtension.fromString(json['status'] ?? 'pending'),
      shippingAddressId: json['shipping_address_id'],
      productName: json['product_name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'user_id': userId,
      'order_date': orderDate.toIso8601String(),
      'total_amount': totalAmount,
      'status': status.toString(),
      'shipping_address_id': shippingAddressId,
      'total_quantity': totalQuantity,
      'image_url': imageUrl,
      'product_name': productName,
      'color': color,
    };

    data['order_id'] = orderId;

    return data;
  }
}
