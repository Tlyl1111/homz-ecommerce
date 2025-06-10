import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:timberr/controllers/detail_category_controller.dart';
import 'package:timberr/models/category.dart';
import 'package:timberr/widgets/custom_app_bar.dart';
import 'package:timberr/widgets/tiles/product_list_tile.dart';

class DetailCategoryScreen extends StatelessWidget {
  const DetailCategoryScreen({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: GetBuilder<DetailCategoryController>(
          builder: (controller) {
            return controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.productsList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        );
                      }
                      final product = controller.productsList[index - 1];
                      return ProductListTile(product: product);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
