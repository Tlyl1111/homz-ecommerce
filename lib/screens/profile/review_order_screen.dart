import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/review_controller.dart';
import 'package:timberr/widgets/buttons/custom_button.dart';
import 'package:timberr/widgets/custom_app_bar.dart';
import 'package:timberr/widgets/input/custom_text_field.dart';
import 'package:timberr/widgets/track_order_item.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetBuilder<ReviewController>(
        builder: (controller) {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Leave Review",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        "Order List",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: controller.orderItemList.length,
                          itemBuilder: (context, index) {
                            final orderItem = controller.orderItemList[index];
                            return TrackOrderItem(orderItem: orderItem);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Your overall rating ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            controller.starRating.value = rating.toInt();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Details",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: "Enter your details",
                        onChanged: (value) {
                          controller.reviewText.value = value;
                        },
                        minLines: 4,
                        maxLines: 6,
                      ),
                      const Spacer(),
                      CustomButton(
                        height: 52,
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await controller.onSubmitReview();
                          Get.back();
                          Get.back();
                        },
                        child: const Text("Submit"),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
