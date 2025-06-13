import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/product_page_controller.dart';
import 'package:timberr/models/product.dart';

class DetailTab extends StatelessWidget {
  final Product product;
  final ProductPageController _productController = Get.find();
  DetailTab({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Color(0xFF325052),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => _productController.decrementQuantity(),
                          child: Image.asset(
                            "assets/minus-circle.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 46,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6DCDC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "${_productController.quantityCounter.value}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _productController.incrementQuantity(),
                          child: Image.asset(
                            "assets/plus-circle.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const TabBar(
                      indicatorColor: Color(0xFF325052),
                      labelColor: Color(0xFF325052),
                      unselectedLabelColor: kOffBlack,
                      tabs: [
                        Tab(
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Featured",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              // color: kOffBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TabBarView(
                        children: [
                          Text(product.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              )),
                          Text(product.featured,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
