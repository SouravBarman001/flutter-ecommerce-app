import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
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
              //color: Colors.blue,
              ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Mega Mall',
              style: AppTextStyle.textStyleOne(
                const Color(0xff3669C9),
                18,
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
                          badgeContent: const Text(''),
                          child: Positioned(
                            child: SizedBox(
                              height: 22,
                              width: 22,
                              child: Image.asset(
                                'images/home_page_icons/bell.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
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
