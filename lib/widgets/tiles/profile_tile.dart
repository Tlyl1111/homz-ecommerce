import 'package:flutter/material.dart';
import 'package:timberr/constants.dart';

class ProfileTile extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onTap;
  const ProfileTile(
      {super.key,
      required this.name,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kNunitoSansBold18,
                ),
                Text(
                  description,
                  style: kNunitoSans12Grey,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: kTinGrey,
            ),
          ],
        ),
      ),
    );
  }
}
