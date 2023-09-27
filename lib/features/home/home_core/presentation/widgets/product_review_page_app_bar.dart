part of '../pages/product_review_page.dart';


class _ProductReviewPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.6,
      shadowColor: Colors.grey.shade50,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      actions: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                HapticFeedback.vibrate();
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Review Product',
              style: AppTextStyle.textStyleOne(
                const Color(0xff000000),
                18,
                FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: HapticFeedback.mediumImpact,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star_outlined,
                          size: 22,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '4.5',
                          style: AppTextStyle.textStyleOne(
                            Colors.black,
                            16,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
