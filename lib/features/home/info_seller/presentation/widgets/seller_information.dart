part of '../pages/info_seller.dart';

class _SellerInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: double.infinity,
      // color: Colors.deepPurple.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Followers',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff838589),
                  14,
                  FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '23 Rb',
                style: AppTextStyle.textStyleOne(
                  Colors.black,
                  14,
                  FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff838589),
                  14,
                  FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '150 Item',
                style: AppTextStyle.textStyleOne(
                  Colors.black,
                  14,
                  FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff838589),
                  14,
                  FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '20 Oct 2021',
                style: AppTextStyle.textStyleOne(
                  Colors.black,
                  14,
                  FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
