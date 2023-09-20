import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/text_style.dart';

class ShippingDialog extends StatefulWidget {
  const ShippingDialog({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<ShippingDialog> createState() => _ShippingDialogState();
}

class _ShippingDialogState extends State<ShippingDialog> {
  bool checkOne = false;
  bool checkTwo = false;
  bool checkThree = false;
  bool checkFour = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 300.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Support',
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
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 0.2,
                      color: Colors.black54,
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.asset('images/info_seller/JE.png'),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'J&T Express',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Reguler, Express',
                                  style: AppTextStyle.textStyleOne(
                                    const Color(0xff838589),
                                    14,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.2,
                      color: Colors.black54,
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.asset('images/info_seller/JT.png'),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'JNE',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'REG, YES',
                                  style: AppTextStyle.textStyleOne(
                                    const Color(0xff838589),
                                    14,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          checkOne = false;
                          checkTwo = false;
                          checkThree = false;
                          checkFour = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff0C1A30),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          'Reset',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff0C1A30),
                            14,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(widget.ctx).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff3669C9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          'Apply',
                          style: AppTextStyle.textStyleOne(
                            Colors.white,
                            14,
                            FontWeight.w500,
                          ),
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
    );
  }
}
