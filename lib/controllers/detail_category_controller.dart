import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/category.dart';
import 'package:timberr/models/product.dart';

class DetailCategoryController extends GetxController {
  final _supabaseInstance = Supabase.instance;
  final Category category = Get.arguments;
  var isLoading = true.obs;
  var productsList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    await getProducts();
    isLoading.value = false;
    update();
  }

  Future<void> getProducts() async {
    try {
      final response = await _supabaseInstance.client
          .from('Products')
          .select()
          .eq('categoryId', category.categoryId);
      List responseList = response;
      debugPrint(responseList.toString());
      productsList.value = responseList
          .map((productResponse) => Product.fromJson(productResponse))
          .toList();
      debugPrint(productsList.toString());
      update();
    } catch (e) {
      debugPrint('Error loading categories: $e');
      update();
    }
  }
}
