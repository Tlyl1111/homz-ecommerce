import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/product_page_controller.dart';

class ColorSelectionColumn extends StatelessWidget {
  final List<Color> colorsList;
  final ProductPageController _controller = Get.find();
  ColorSelectionColumn({super.key, required this.colorsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Obx(
        () => Column(
          children: [
            for (int i = 0; i < colorsList.length; i++)
              GestureDetector(
                onTap: () {
                  _controller.colorIndex.value = i;
                },
                child: AnimatedContainer(
                  height: 30,
                  width: 30,
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: _controller.colorIndex.value == i
                        ? Border.all(
                            width: 2.5,
                            color: colorsList[i],
                          )
                        : null,
                  ),
                  child: Center(
                    child: Container(
                      height: _controller.colorIndex.value == i ? 20 : 30,
                      width: _controller.colorIndex.value == i ? 20 : 30,
                      decoration: BoxDecoration(
                        color: colorsList[i],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
