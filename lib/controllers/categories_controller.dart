// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:timberr/constants.dart';
// import 'package:timberr/models/category.dart';

// class CategoriesController extends GetxController {
//   final _supabaseInstance = Supabase.instance;
//   var isLoading = true.obs;
//   var categoryList = <Category>[].obs;

//   @override
//   void onInit() {
//     fetchCategories();
//     super.onInit();
//   }

//   Future<void> fetchCategories() async {
//     await getCategories();
//     isLoading.value = false;
//     update([kCategories]);
//   }

//   Future<void> getCategories() async {
//     try {
//       final response =
//           await _supabaseInstance.client.from('Categories').select();
//       List responseList = response;
//       debugPrint(responseList.toString());
//       categoryList.value = responseList
//           .map((categoryResponse) => Category.fromJson(categoryResponse))
//           .toList();
//       debugPrint(categoryList.toString());
//       update([kCategories]);
//     } catch (e) {
//       debugPrint('Error loading categories: $e');
//       update([kCategories]);
//     }
//   }
// }
