import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});
  final Widget child;

  @override
  State<MainPage> createState() =>
      _MainPageState();
}

class _MainPageState
    extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
       body: widget.child,
       bottomNavigationBar: const BottomNavBar(),
      );

  }
}
