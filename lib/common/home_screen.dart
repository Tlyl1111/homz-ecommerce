import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () {})],
      ),
      body: const Center(child: Text("Welcom toHomz!")),
    );
  }
}
