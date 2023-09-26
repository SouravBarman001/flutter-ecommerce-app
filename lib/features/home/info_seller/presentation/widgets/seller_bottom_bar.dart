part of '../pages/info_seller.dart';

class _SellerBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      // color: Colors.blue,
      height: 90,
      width: double.infinity,
      color: const Color(0xfffafafa),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              SellerInfoDialogHelper.infoSellerDialogBox(context);
              HapticFeedback.mediumImpact();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 140.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff0C1A30),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Sorting',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff0C1A30),
                  14,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 140.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Follow',
                style: AppTextStyle.textStyleOne(
                  Colors.white,
                  14,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
