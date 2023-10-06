import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomStateProvider = StateNotifierProvider<BottomNavProvider, int>(
    (ref) => BottomNavProvider(0),);

class BottomNavProvider extends StateNotifier<int> {
  BottomNavProvider(super.state);

  void setIndex(int value) {
    state = value;
  }
}
