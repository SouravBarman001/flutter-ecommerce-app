import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class SeeAllProductSearchFilterDialog extends StatefulWidget {
  const SeeAllProductSearchFilterDialog({required this.ctx, super.key});
  final BuildContext ctx;

  @override
  State<SeeAllProductSearchFilterDialog> createState() => _SeeAllProductSearchFilterDialogState();
}

class _SeeAllProductSearchFilterDialogState extends State<SeeAllProductSearchFilterDialog>
    with SingleTickerProviderStateMixin {
  double start = 50; // Initial value for the left thumb
  double end = 100; // Initial value for the right thumb
  bool isCheckedOne = false;
  bool isCheckedTwo = false;
  bool isCheckedThree = false;

  bool checkOne = false;
  bool checkTwo = false;
  bool checkThree = false;
  bool checkFour = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        height: 370.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: TabBar(
                      onTap: (tab) {
                        print('tab $tab');
                        setState(() {
                          _selectedIndex = tab;
                        });
                      },
                      labelPadding: const EdgeInsets.only(left: 0, right: 18),
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Filter',
                        ),
                        Tab(
                          text: 'Sorting',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    // color: Colors.blueAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price Range',
                          style: AppTextStyle.textStyleOne(
                            Colors.black,
                            14,
                            FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment
                              .centerLeft, // Align the RangeSlider to the left
                          child: SliderTheme(
                            data: SliderThemeData(
                              overlayShape: SliderComponentShape.noOverlay,
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              rangeThumbShape: const RoundRangeSliderThumbShape(
                                enabledThumbRadius: 10,
                              ),
                              rangeTickMarkShape:
                              const RoundRangeSliderTickMarkShape(
                                tickMarkRadius: 5,
                              ),
                            ),
                            child: RangeSlider(
                              values: RangeValues(start, end),
                              labels:
                              RangeLabels(start.toString(), end.toString()),
                              onChanged: (value) {
                                setState(() {
                                  final double rangeDifference =
                                      value.end - value.start;
                                  print('Range Difference: $rangeDifference');
                                  start = value.start;
                                  end = value.end;
                                });
                              },
                              min: 10.0,
                              max: 150.0, // Set max to 150 to allow
                              // a range of 50 to 100
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp 50.000',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Rp 100.000',
                                style: AppTextStyle.textStyleOne(
                                  Colors.black,
                                  14,
                                  FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            HapticFeedback.mediumImpact();
                            setState(() {
                              isCheckedOne = !isCheckedOne;
                            });
                          },
                          child: Container(
                            color: const Color(0xff00FFFFFF),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'All Sub Categories',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                GFCheckbox(
                                  size: 23,
                                  activeBgColor: Colors.red,
                                  type: GFCheckboxType.circle,
                                  onChanged: (value) {
                                    HapticFeedback.mediumImpact();
                                    setState(() {
                                      isCheckedOne = value;
                                    });
                                  },
                                  activeIcon: const Icon(
                                    Icons.check,
                                    size: 15,
                                    weight: 5,
                                    color: Colors.white,
                                  ),
                                  value: isCheckedOne,
                                  inactiveIcon: null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            HapticFeedback.mediumImpact();
                            setState(() {
                              isCheckedTwo = !isCheckedTwo;
                            });
                          },
                          child: Container(
                            color: const Color(0xff00FFFFFF),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hand-phone',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                GFCheckbox(
                                  size: 23,
                                  activeBgColor: Colors.red,
                                  type: GFCheckboxType.circle,
                                  onChanged: (value) {
                                    HapticFeedback.mediumImpact();

                                    setState(() {
                                      isCheckedTwo = value;
                                    });
                                  },
                                  activeIcon: const Icon(
                                    Icons.check,
                                    size: 15,
                                    weight: 5,
                                    color: Colors.white,
                                  ),
                                  value: isCheckedTwo,
                                  inactiveIcon: null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            HapticFeedback.mediumImpact();
                            setState(() {
                              isCheckedThree = !isCheckedThree;
                            });
                          },
                          child: Container(
                            color: const Color(0xff00FFFFFF),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Computer',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                GFCheckbox(
                                  size: 23,
                                  activeBgColor: Colors.red,
                                  type: GFCheckboxType.circle,
                                  onChanged: (value) {
                                    HapticFeedback.mediumImpact();

                                    setState(() {
                                      isCheckedThree = value;
                                    });
                                  },
                                  activeIcon: const Icon(
                                    Icons.check,
                                    size: 15,
                                    weight: 5,
                                    color: Colors.white,
                                  ),
                                  value: isCheckedThree,
                                  inactiveIcon: null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
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
                          onTap: () {
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
                                Text(
                                  'Name (A-Z)',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                if (checkOne) SizedBox(
                                  height: 29,
                                  width: 29,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/icons/tick.png',),
                                  ),
                                ) else const SizedBox(),
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
                          onTap: () {
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
                                Text(
                                  'Name (Z-A)',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                if (checkTwo) SizedBox(
                                  height: 29,
                                  width: 29,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/icons/tick.png',),
                                  ),
                                ) else const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black54,
                        ),
                        GestureDetector(
                          onTap: () {
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
                                Text(
                                  'Price (High-Low)',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                if (checkThree) SizedBox(
                                  height: 29,
                                  width: 29,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/icons/tick.png',),
                                  ),
                                ) else const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black54,
                        ),
                        GestureDetector(
                          onTap: () {
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
                                Text(
                                  'Price (Low-High)',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14,
                                    FontWeight.w600,
                                  ),
                                ),
                                if (checkFour) SizedBox(
                                  height: 29,
                                  width: 29,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/icons/tick.png',),
                                  ),
                                ) else const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {

                        HapticFeedback.mediumImpact();
                        if(_selectedIndex == 0){
                          setState(() {
                            isCheckedOne = false;
                            isCheckedTwo = false;
                            isCheckedThree = false;
                          }
                          );
                        }else{
                          setState(() {
                            checkOne = false;
                            checkTwo = false;
                            checkThree = false;
                            checkFour = false;
                          }
                          );
                        }
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
