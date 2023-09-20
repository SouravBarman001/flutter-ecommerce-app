import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/text_style.dart';

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  Map<String, String> categoryItems = {
    'Fashion': 'fashion.png',
    'Foods': 'foods.png',
    'Gadget': 'gadget.png',
    'Gift': 'gift.png',
    'Souvenir': 'souvenir.png',
    'Computer': 'gadget.png',
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 170.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final entry = categoryItems.entries.elementAt(index);
                    final key = entry.key;
                    final value = entry.value;
                    return GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        context.go('/home/category-details/$key');
                        Navigator.of(widget.ctx).pop();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 5, right: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Display the key
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: Image.asset(
                                'images/home_page_icons/category_icons/$value',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              key.toString(),
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
  }
}
