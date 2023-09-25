part of '../pages/sign_in_page.dart';

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/reset');
        HapticFeedback.mediumImpact();
      },
      child: Text(
        'Forgot Password',
        style: AppTextStyle.textStyleOne(
          Colors.black,
          15.0,
          FontWeight.w500,
        ),
      ),
    );
  }
}
