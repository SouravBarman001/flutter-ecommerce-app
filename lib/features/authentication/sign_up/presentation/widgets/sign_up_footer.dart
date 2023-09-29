part  of '../pages/sign_up_page.dart';

class _SignUpFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Have an Account?',
            style: AppTextStyle.textStyleOne(
              const Color(0xff838589), 15, FontWeight.w500,),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              context.pop();
              HapticFeedback.mediumImpact();
            },
            child: Text(
              'Sign In',
              style: AppTextStyle.textStyleOne(
                const Color(0xff3669C9), 15, FontWeight.w600,),
            ),
          ),
        ],
      ),
    );
  }
}
