import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
      ),
      body: const Center(
        child: Text('WishList'),
      ),
    );
  }
}
