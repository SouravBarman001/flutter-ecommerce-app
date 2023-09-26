import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoSellerDialog extends StatefulWidget {
  const InfoSellerDialog({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<InfoSellerDialog> createState() => _InfoSellerDialogState();
}

class _InfoSellerDialogState extends State<InfoSellerDialog> {


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
                    'Filter & Sorting',
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
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  // color: Colors.blueAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        thickness: 0.2,
                        color: Colors.black54,
                      ),

                     // const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          HapticFeedback.mediumImpact();
                          setState(() {
                            checkOne = !checkOne;
                          });

                        },
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Name (A-Z)',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),),
                              checkOne ? SizedBox(
                                height:29,
                                width : 29,
                                child: ClipOval(
                                  child: Image.asset('images/icons/tick.png'),
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                     // const SizedBox(height: 10,),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.black54,
                      ),

                      GestureDetector(
                        onTap: (){
                          HapticFeedback.mediumImpact();
                          setState(() {
                            checkTwo = !checkTwo;
                          });

                        },
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Name (Z-A)',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),),
                              checkTwo ? SizedBox(
                                height:29,
                                width :29,
                                child: ClipOval(
                                  child: Image.asset('images/icons/tick.png'),
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.black54,
                      ),
                      GestureDetector(
                        onTap: (){
                          HapticFeedback.mediumImpact();
                          setState(() {
                            checkThree = !checkThree;
                          });

                        },
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price (High-Low)',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),),
                              checkThree ? SizedBox(
                                height:29,
                                width : 29,
                                child: ClipOval(
                                  child: Image.asset('images/icons/tick.png'),
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.black54,
                      ),
                      GestureDetector(
                        onTap:(){
                          HapticFeedback.mediumImpact();
                          setState(() {
                            checkFour = !checkFour;
                          });

                        },
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price (Low-High)',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),),
                              checkFour ? SizedBox(
                                height:29,
                                width : 29,
                                child: ClipOval(
                                  child: Image.asset('images/icons/tick.png'),
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),

                    ],
                  ),
                ),
              ],
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
