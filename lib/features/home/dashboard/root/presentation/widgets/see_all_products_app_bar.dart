part of '../pages/see_all_product_page.dart';

class _SeeAllProductsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
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
          child: GestureDetector(
            onTap: () {
              context.pop();
              HapticFeedback.vibrate();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '',
              style: AppTextStyle.textStyleOne(
                Colors.black,
                16,
                FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            //color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: HapticFeedback.mediumImpact,
                    child: Stack(
                      children: [
                        badges.Badge(
                          position:
                          badges.BadgePosition.topEnd(top: -9, end: -1),
                          showBadge: true,
                          ignorePointer: false,
                          badgeContent: const Text(''),
                          child: Positioned(
                            child: SizedBox(
                              height: 22,
                              width: 22,
                              child: Image.asset(
                                'images/home_page_icons/shopping-cart.png',
                                fit: BoxFit.cover,
                              ),
                            ),
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
