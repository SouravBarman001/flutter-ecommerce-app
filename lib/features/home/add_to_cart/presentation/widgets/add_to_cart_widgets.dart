import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/text_style.dart';

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  Map<String, String> categoryItems = {
    'Fashion': 'fashion.png',
    'Foods': 'foods.png',
    'Gadget': 'gadget.png',
    'Gift': 'gift.png',
    'Souvenir': 'souvenir.png',
    'Computer': 'gadget.png',
  };

  int itemCount = 1;
  int itemSelected = 0;
  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  List<String> variants = ['Black', 'White', 'Blue', 'Green'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
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
                    'Add To Cart',
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
            Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add to Wishlist',
                        style: AppTextStyle.textStyleOne(
                          Colors.black,
                          14,
                          FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              decrementItem();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            itemCount.toString(),
                            style: AppTextStyle.textStyleOne(
                              itemCount > 1
                                  ? Colors.black
                                  : const Color(0xffC4C5C4),
                              14,
                              FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              incrementItem();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              height: 80,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Variant',
                    style: AppTextStyle.textStyleOne(
                      Colors.black,
                      14,
                      FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: variants.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              HapticFeedback.mediumImpact();
                              itemSelected = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: itemSelected == index
                                  ? const Color(0xffeff5fb)
                                  : Colors.white,
                              border: Border.all(
                                color: itemSelected == index
                                    ? Colors.white
                                    : Colors.grey[300]!,
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              variants[index],
                              style: AppTextStyle.textStyleOne(
                                itemSelected == index
                                    ? const Color(0xff3669C9)
                                    : Colors.black,
                                14,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
            Container(
              alignment: Alignment.centerLeft,

              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Text(
                    'Total Shopping',
                    style: AppTextStyle.textStyleOne(
                      const Color(0xff838589),
                      14,
                      FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp 1.500.000',
                    style: AppTextStyle.textStyleOne(
                      Colors.black,
                      15,
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              child: GestureDetector(
                onTap: HapticFeedback.mediumImpact,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff3669C9),
                  ),
                  child: Text(
                    'Add To Card',
                    style: AppTextStyle.textStyleOne(
                      Colors.white,
                      14,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
