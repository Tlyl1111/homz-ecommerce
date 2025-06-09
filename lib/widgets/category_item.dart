import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timberr/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, this.onTap});

  final Category category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFCFD0D0),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(category.iconPath),
            ),
          ),
          const SizedBox(height: 10),
          Text(category.name),
        ],
      ),
    );
  }
}
