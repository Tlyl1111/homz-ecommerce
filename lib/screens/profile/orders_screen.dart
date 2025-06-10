import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/order_controller.dart';
import 'package:timberr/models/order_status.dart';
import 'package:timberr/widgets/cards/order_card.dart';
import 'package:timberr/widgets/order_list_tile.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: kOffBlack,
                size: 20,
              ),
            ),
            centerTitle: true,
            title: const Text(
              "MY ORDERS",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: kOffBlack,
              ),
            ),
            bottom: TabBar(
              labelColor: kOffBlack,
              labelStyle: kNunitoSansBold18,
              unselectedLabelColor: kTinGrey,
              unselectedLabelStyle: kNunitoSans18,
              indicator: BoxDecoration(
                color: kOffBlack,
                borderRadius: BorderRadius.circular(4),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorColor: kOffBlack,
              indicatorPadding:
                  const EdgeInsets.only(left: 16, right: 16, top: 43),
              tabs: [
                Tab(
                  text: OrderStatus.pending.name,
                ),
                Tab(
                  text: OrderStatus.pickUp.name,
                ),
                Tab(
                  text: OrderStatus.shipping.name,
                ),
                Tab(
                  text: OrderStatus.delivered.name,
                ),
                Tab(
                  text: OrderStatus.canceled.name,
                ),
              ],
            ),
          ),
          body: Obx(() {
            return orderController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: orderController.pendingOrderList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderListTile(
                              order: orderController.pendingOrderList[index]);
                        },
                      ),
                      ListView.builder(
                        itemCount: orderController.pickUpOrderList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderListTile(
                              order: orderController.shippingOrderList[index]);
                        },
                      ),
                      ListView.builder(
                        itemCount: orderController.shippingOrderList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderListTile(
                              order: orderController.shippingOrderList[index]);
                        },
                      ),
                      ListView.builder(
                        itemCount: orderController.deliveredOrderList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderCard(
                            orderNumber: (index + 1) * 102,
                            dateString: "22/04/2022",
                            quantity: index % 5 + 1,
                            totalAmount: (index + 1) * 40,
                            orderStatus: 2,
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: orderController.cancelledOrderList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OrderListTile(
                              order: orderController.cancelledOrderList[index]);
                        },
                      ),
                    ],
                  );
          })),
    );
  }
}
