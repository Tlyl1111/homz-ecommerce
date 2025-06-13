import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/product.dart';

class FavoritesController extends GetxController {
  var favoritesList = <Product>[].obs;
  final _supabaseClient = Supabase.instance.client;
  @override
  void onInit() {
    fetchFavorites();
    super.onInit();
  }

  Future<void> fetchFavorites() async {
    try {
      final response = await _supabaseClient
          .from("Users")
          .select()
          .eq("Uid", _supabaseClient.auth.currentUser!.id)
          .limit(1)
          .maybeSingle();

      if (response == null || response['favoritesList'] == null) {
        favoritesList.clear();
        return;
      }

      final List<dynamic> rawList = jsonDecode(response['favoritesList']);
      final List<int> favoriteIds =
          rawList.map((e) => (e as num).toInt()).toList();
      debugPrint("Favorites ID List: $favoriteIds");

      final futures = favoriteIds.map((productId) async {
        final productResponse = await _supabaseClient
            .from('Products')
            .select()
            .eq("product_id", productId)
            .limit(1)
            .maybeSingle();

        if (productResponse != null) {
          return Product.fromJson(productResponse);
        }
        return null;
      });

      final results = await Future.wait(futures);

      favoritesList
        ..clear()
        ..addAll(results.whereType<Product>());
    } catch (e, st) {
      debugPrint('fetchFavorites error: $e\n$st');
    }
  }

  Future<void> updateDatabase() async {
    await _supabaseClient.from('Users').update({
      'favoritesList':
          favoritesList.map((favoriteItem) => favoriteItem.productId).toList()
    }).eq("Uid", _supabaseClient.auth.currentUser!.id);
  }

  Future<void> addProduct(Product product) async {
    favoritesList.add(product);
    await updateDatabase();
  }

  Future<void> removeProduct(Product product) async {
    favoritesList.remove(product);
    await updateDatabase();
  }

  Future<void> removeProductAt(int index) async {
    favoritesList.removeAt(index);
    await updateDatabase();
  }
}
