import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/bottom_nav_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(bottomStateProvider);

    return NavigationBar(
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.category_outlined, color: Colors.white),
          icon: Icon(Icons.category),
          label: 'wishlist',
        ),
        NavigationDestination(
          selectedIcon:
              Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
          icon: Icon(Icons.add_shopping_cart),
          label: 'order',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.settings_outlined, color: Colors.white),
          icon: Icon(Icons.settings),
          label: 'account',
        ),
      ],
      selectedIndex: position,
      indicatorColor: Colors.blueAccent,
      onDestinationSelected: _onItemTapped,
    );
  }

  void _onItemTapped(index) {
    ref.read(bottomStateProvider.notifier).setIndex(index);
    HapticFeedback.mediumImpact();
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/wish-list');
        break;
      case 2:
        context.go('/order');
        break;
      case 3:
        context.go('/account');
        break;
    }
  }
}
