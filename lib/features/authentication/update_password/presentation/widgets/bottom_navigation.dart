part of '../pages/update_password_page.dart';
class _BottomNavigation extends ConsumerStatefulWidget {

  @override
  ConsumerState<_BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<_BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final state = ref.read(updatePasswordProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
     // color: Colors.blue,
      height: 115,
      width: 0.9.sw,
      child: Button(label: 'Save Update',
        onPressed: HapticFeedback.mediumImpact,
        disable: state.isDisabled,
      ),
    );
  }
}
