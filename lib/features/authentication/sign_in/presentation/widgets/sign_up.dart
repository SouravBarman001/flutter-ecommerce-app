part of '../pages/sign_in_page.dart';

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/signup');
        HapticFeedback.mediumImpact();
      },
      child: Text(
        'Sign Up',
        style: AppTextStyle.textStyleOne(
          Colors.blue,
          15.0,
          FontWeight.w500,
        ),
      ),
    );
  }
}
