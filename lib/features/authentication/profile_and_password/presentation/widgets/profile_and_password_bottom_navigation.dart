part of '../pages/profile_and_password_page.dart';

class _ProfileAndPasswordBottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      // color: Colors.blue,
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            width: 0.8.sw,
            label: 'Confirmation',
            onPressed: ()=>   HapticFeedback.mediumImpact,
          ),
        ],
      ),
    );
  }
}
