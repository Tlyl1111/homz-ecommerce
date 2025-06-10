import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:timberr/controllers/product_page_controller.dart';
import 'package:timberr/widgets/review_card.dart';

class ReviewTab extends StatelessWidget {
  final ProductPageController _productController = Get.find();

  ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_productController.reviews.isEmpty) {
        return const Center(
          child: Text(
            'No reviews yet',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      return Column(
        children: [
          const SizedBox(height: 16),
          RatingSummary(
            counter: _productController.reviews.length,
            average: _productController.reviews.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.rating) /
                _productController.reviews.length,
            showAverage: true,
            counterFiveStars: _productController.reviews.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.rating == 5 ? 1 : 0)),
            counterFourStars: _productController.reviews.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.rating == 4 ? 1 : 0)),
            counterThreeStars: _productController.reviews.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.rating == 3 ? 1 : 0)),
            counterTwoStars: _productController.reviews.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.rating == 2 ? 1 : 0)),
            counterOneStars: _productController.reviews.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.rating == 1 ? 1 : 0)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: _productController.reviews.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final review = _productController.reviews[index];
                      return ReviewCard(review: review);
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
