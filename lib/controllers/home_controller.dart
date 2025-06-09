import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/models/product.dart';

class HomeController extends GetxController {
  final _supabaseInstance = Supabase.instance;
  var selectedCategory = 0.obs;
  var productsList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  Future<void> fetchHomeData() async {
    getProducts(0);
    isLoading.value = false;
    update([kHome]);
  }

  Future<void> getProducts(int categoryId) async {
    try {
      final response = (categoryId == 0)
          ? await _supabaseInstance.client.from('Products').select()
          : await _supabaseInstance.client
              .from('Products')
              .select()
              .eq('categoryId', categoryId);

      List responseList = response;
      debugPrint(responseList.toString());

      productsList.value = responseList
          .map((productResponse) => Product.fromJson(productResponse))
          .toList();
      update([kHome]);
    } catch (e) {
      debugPrint('Error loading products: $e');
      update([kHome]);
    }
  }

  Future<void> refreshProducts() async {
    isLoading.value = true;
    update([kHome]);
    await getProducts(selectedCategory.value);
    isLoading.value = false;
    update([kHome]);
  }
}
