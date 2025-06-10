import 'package:flutter/material.dart';
import 'package:timberr/models/order.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/widgets/order_button.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  order.imageUrl,
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF325052),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  order.totalQuantity.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'Poppins'),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(order.productName,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: order.color.colorFromString(order.color),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(order.color)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Cost:"),
                    Text("\$${order.totalAmount.toString()}",
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (!order.isReviewed)
                OrderButton(
                  order: order,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
