import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppbar({super.key});
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
                context.goNamed(Routers.homeRoot);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Detail Product',
              style: AppTextStyle.textStyleOne(
                const Color(0xff000000),
                18,
                FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: HapticFeedback.mediumImpact,
                    child: SizedBox(
                      height: 22,
                      width: 22,
                      child: Image.asset(
                        'images/product_detail_icons/redo.png',
                        fit: BoxFit.cover,
                      ),
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
