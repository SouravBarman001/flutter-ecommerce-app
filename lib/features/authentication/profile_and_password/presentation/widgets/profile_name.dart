part of '../pages/profile_and_password_page.dart';

class _ProfileName extends StatelessWidget {
  const _ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.fullName,
          style: AppTextStyle.smallTextTwo,
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 45,
          padding: const EdgeInsets.only(top: 12, left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xfffafafa),
          ),
          child: Text(
            'Sourav Barman',
            style: AppTextStyle.textStyleOne(
              Colors.black,
              12.sp,
              FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
