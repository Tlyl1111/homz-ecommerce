import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {super.key, required this.icon, required this.isActive, this.onTap});
  final Widget icon;
  final bool isActive;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? ActiveItem(icon: icon)
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: icon,
            ),
    );
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(92),
          color: const Color(0xFF325052)),
      height: 40,
      width: 80,
      child: Center(child: icon),
    );
  }
}
