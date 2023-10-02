part of '../pages/sign_in_page.dart';

class _Footer extends StatelessWidget {
  const _Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50.h,
      width: 0.9.w,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ForgotPassword(),
            _SignUp(),
          ],
        ),
      ),
    );
  }
}
