import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/order_controller.dart';
import 'package:timberr/models/order_status.dart';
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
              isScrollable: true,
              labelColor: kOffBlack,
              labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF325052)),
              unselectedLabelColor: kTinGrey,
              unselectedLabelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kBasaltGrey),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              indicatorColor: const Color(0xFF325052),
              // indicatorPadding:
              //     const EdgeInsets.only(left: 16, right: 16, top: 43),
              tabs: [
                Tab(
                  text: OrderStatus.pending.displayName,
                ),
                Tab(
                  text: OrderStatus.pickUp.displayName,
                ),
                Tab(
                  text: OrderStatus.shipping.displayName,
                ),
                Tab(
                  text: OrderStatus.delivered.displayName,
                ),
                Tab(
                  text: OrderStatus.canceled.displayName,
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
                              order: orderController.pickUpOrderList[index]);
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
                          return OrderListTile(
                              order: orderController.deliveredOrderList[index]);
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
