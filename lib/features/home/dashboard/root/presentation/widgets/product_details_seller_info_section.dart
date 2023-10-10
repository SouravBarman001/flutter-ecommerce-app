
part of '../pages/home_page.dart';

class _ProductDetailsSellerInfoSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        context.push('/product-details/info-seller');
      },
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: const Color(0xffB5D98CFF), //   const Color(0xfffafafa),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(
                  0xfffafafa,
                ), //   const Color(0xfffafafa),
              ),
              child: Image.asset(
                'images/icons/shop.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shop Larson Electronic',
                  style: AppTextStyle.textStyleOne(
                    Colors.black,
                    14,
                    FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Official Store',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        12,
                        FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        'images/icons/shield.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: Container(
                // color: Colors.red,
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
