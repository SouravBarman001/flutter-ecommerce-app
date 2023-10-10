import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.child, super.key});
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
