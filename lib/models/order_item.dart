class OrderItem {
  final int orderItemId;
  final String orderId;
  final int productId;
  final int quantity;
  final double unitPrice;
  final String colorName;
  final String productName;
  final String imageUrl;

  OrderItem({
    required this.orderItemId,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.colorName,
    required this.productName,
    required this.imageUrl,
  });

  // Calculate the total price for this item
  double get totalPrice => quantity * unitPrice;

  // Create an OrderItem from a CartItem
  factory OrderItem.fromCartItem(Map<String, dynamic> item) {
    return OrderItem(
      orderItemId: item['order_item_id'],
      orderId: item['order_id'],
      productId: item['product_id'],
      quantity: item['quantity'],
      unitPrice: item['unit_price'],
      colorName: item['color_name'],
      productName: item['product_name'],
      imageUrl: item['image_url'],
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      orderItemId: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      unitPrice: json['unit_price']?.toDouble() ?? 0,
      colorName: json['color_name'],
      productName: json['product_name'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'product_id': productId,
      'quantity': quantity,
      'unit_price': unitPrice,
      'color_name': colorName,
      'product_name': productName,
      'image_url': imageUrl,
    };

    data['order_item_id'] = orderItemId;
    data['order_id'] = orderId;

    return data;
  }
}
