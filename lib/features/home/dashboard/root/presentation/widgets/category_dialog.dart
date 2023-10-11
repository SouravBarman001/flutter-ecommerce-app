import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/category_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryDialog extends ConsumerStatefulWidget {
  const CategoryDialog({required this.ctx, super.key});
  final BuildContext ctx;

  @override
  ConsumerState<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends ConsumerState<CategoryDialog> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryItemNotifierProvider);

    if (state.status == Status.success) {
      final List<String> categoryItems = state.data;

      return DefaultTabController(
        length: 2,
        child: Container(
          height: 135.h,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Categories',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xff0C1A30),
                          16,
                          FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.of(widget.ctx).pop();
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final value = categoryItems[index];
                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.heavyImpact();
                          context.go(
                              '/${Routers.homeRoot}/category-details/$value');
                          Navigator.of(widget.ctx).pop();
                        },
                        child: Container(
                          height: 100,
                          width: 120,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 5, right: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Display the key
                              SizedBox(
                                height: 58,
                                width: 58,
                                child: Image.asset(
                                  'images/home_page_icons/category_icons/fashion.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                value,
                                style: AppTextStyle.smallTextOne,
                              ), // Display the corresponding image
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: 110.h,
        width: double.infinity,
        child: const Text('No Data Available'),
      );
    }
  }
}
