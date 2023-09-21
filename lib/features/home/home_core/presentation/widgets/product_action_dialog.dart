import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/text_style.dart';

class ProductActionDialog extends StatefulWidget {
  const ProductActionDialog({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<ProductActionDialog> createState() => _ProductActionDialogState();
}

class _ProductActionDialogState extends State<ProductActionDialog> {
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
    return Container(
      height: 210.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Action',
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
              color: Colors.white,
              width: double.infinity,
              child: Text(
                'Add to Wishlist',
                style: AppTextStyle.textStyleOne(
                  Colors.black, 14, FontWeight.w600,),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              color: Colors.white,
              width: double.infinity,
              child: Text(
                'Share Product',
                style: AppTextStyle.textStyleOne(
                  Colors.black, 14, FontWeight.w600,),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.center ,
              width: double.infinity,
              height: 70,
              child: GestureDetector(
                onTap: (){
                  HapticFeedback.mediumImpact();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff3669C9),
                  ),
                  child: Text(
                    'Add To Cart',
                    style: AppTextStyle.textStyleOne(
                      Colors.white, 14, FontWeight.w600,),
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
