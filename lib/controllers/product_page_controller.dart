import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/models/review.dart';

class ProductPageController extends GetxController {
  var imageIndex = 0.obs;
  var colorIndex = 0.obs;
  var quantityCounter = 1.obs;
  var isLoading = true.obs;
  var reviews = <Review>[].obs;
  final _supabaseClient = Supabase.instance.client;
  final Product product = Get.arguments;

  void incrementQuantity() {
    quantityCounter.value++;
    update();
  }

  void decrementQuantity() {
    if (quantityCounter.value > 1) {
      quantityCounter.value--;
      update();
    }
  }

  Future<void> fetchReviews() async {
    try {
      final response = await _supabaseClient
          .from('Reviews')
          .select(
              'id, content, rating, created_at, Users(Name, profile_picture_url)')
          .eq('product_id', product.productId);
      List responseList = response;
      debugPrint(responseList.toString());
      reviews.value = responseList
          .map((reviewResponse) => Review.fromJson(reviewResponse))
          .toList();
      isLoading.value = false;
      update();
    } catch (e) {
      debugPrint('Error loading reviews: $e');
      isLoading.value = false;
      update();
    }
  }

  @override
  void onInit() {
    fetchReviews();
    super.onInit();
  }
}
