part of '../pages/info_seller.dart';

class _SellerAppBar extends StatelessWidget  implements PreferredSizeWidget {
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
              'Info Seller',
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
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: HapticFeedback.mediumImpact,
                    child: Stack(
                      children: [
                        badges.Badge(
                          position:
                          badges.BadgePosition.topEnd(top: -9, end: -1),
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
