import 'package:flutter/material.dart';
import 'package:timberr/models/product.dart';

class CartItem extends Product {
  int cartId;
  int quantity;
  late Color color;
  CartItem(
      this.cartId, this.quantity, String colorString, Map<String, dynamic> json)
      : super(
          json['product_id'],
          json['name'],
          json['price'],
          json['description'],
          json['categoryId'],
          json['colorsList'].toString().split(",").toList()
            ..map((e) => colorFromString(e)).toList(),
          json['imagesList'].toString().split(",").toList(),
          json['featured'],
        ) {
    color = colorFromString(colorString);
  }
  void addQuantity(int newQuantity) {
    quantity += newQuantity;
  }

  void removeQuantity(int newQuantity) {
    quantity -= newQuantity;
  }

  Product getProduct() {
    return super.productElement();
  }
}

extension CartItemExtension on CartItem {
  String colorToString(Color color) {
    if (color == Colors.red) {
      return "red";
    } else if (color == Colors.green) {
      return "green";
    } else if (color == Colors.blue) {
      return "blue";
    } else if (color == Colors.white) {
      return "white";
    } else if (color == Colors.black) {
      return "black";
    } else if (color == Colors.purple) {
      return "purple";
    } else if (color == Colors.orange) {
      return "orange";
    } else if (color == Colors.indigo) {
      return "indigo";
    } else if (color == Colors.teal) {
      return "teal";
    } else if (color == Colors.grey) {
      return "grey";
    } else if (color == Colors.amber) {
      return "amber";
    } else if (color == Colors.cyan) {
      return "cyan";
    } else if (color == Colors.brown) {
      return "brown";
    } else if (color == Colors.lime) {
      return "lime";
    } else if (color == Colors.pink) {
      return "pink";
    } else if (color == Colors.yellow) {
      return "yellow";
    } else {
      return "white";
    }
  }
}
