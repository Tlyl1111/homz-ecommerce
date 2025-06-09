import 'package:flutter/material.dart';

enum OrderStatus { pending, pickUp, shipping, delivered, canceled }

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.pickUp:
        return 'Pick Up';
      case OrderStatus.shipping:
        return 'Shipping';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.canceled:
        return 'Cancelled';
    }
  }

  static OrderStatus fromString(String statusStr) {
    switch (statusStr) {
      case 'pending':
        return OrderStatus.pending;
      case 'pickUp':
        return OrderStatus.pickUp;
      case 'shipping':
        return OrderStatus.shipping;
      case 'delivered':
        return OrderStatus.delivered;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.pending;
    }
  }

  Color get statusColor {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.pickUp:
        return Colors.blue;
      case OrderStatus.shipping:
        return Colors.indigo;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }
}
