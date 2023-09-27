part of '../pages/search_product.dart';
// part of '../../../home_core/presentation/pages/home_page.dart';


class _SearchPageAppBar extends StatelessWidget  implements PreferredSizeWidget {

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
              'Search',
              style: AppTextStyle.textStyleOne(
                Colors.black,
                16,
                FontWeight.w700,
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(
            //color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}
