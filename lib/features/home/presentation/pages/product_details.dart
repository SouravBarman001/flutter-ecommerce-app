import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../core/constant/media_query_size.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../core/router/routers.dart';
import '../../data/domain/FeaturedProductModel.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.data});
  FeaturedProductModel data;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        shadowColor: Colors.grey.shade50,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      HapticFeedback.vibrate();
                      context.goNamed(RoutersName.home);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
              )),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Detail Product',
                style: AppTextStyle.textStyleOne(
                    const Color(0xff000000), 18.0, FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
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
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                      child: Stack(
                        children: [
                          badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -9, end: -1),
                            showBadge: true,
                            ignorePointer: false,
                            badgeContent: const Text(''),
                            child: Positioned(
                              child: Container(
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(0.7),
                  width: double.infinity,
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.data.imgUrl.toString(),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding:
                        const EdgeInsets.only(left: 5, right: 10, bottom: 5),
                    height: 120,
                    width: double.infinity,
                    // color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.data.name.toString(),
                          style: AppTextStyle.textStyleOne(
                              Colors.black, 24.0, FontWeight.w700),
                        ),
                        Text(
                          "Rp. 1.500.000",
                          style: AppTextStyle.textStyleOne(
                              const Color(0xffFE3A30), 16.0, FontWeight.w600),
                        ),
                        Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC120),
                                      size: 18,
                                    ),
                                    Text(
                                      widget.data.rating.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  '${widget.data.review.toString()} Reviews',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Available : 250',
                                      style: AppTextStyle.textStyleOne(
                                          const Color(0xff3A9B7A),
                                          12,
                                          FontWeight.w600),
                                    ))),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   // color: Colors.lightGreen, //   const Color(0xfffafafa),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(
                              0xfffafafa), //   const Color(0xfffafafa),
                        ),
                        child: Image.asset(
                          'images/home_page_icons/bell.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shop Larson Electronic',
                            style: AppTextStyle.textStyleOne(
                                Colors.black, 14, FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Official Store',
                            style: AppTextStyle.textStyleOne(
                                Colors.black, 12, FontWeight.w400),
                          )
                        ],
                      ),
                      Flexible(
                          child: Container(
                           // color: Colors.red,
                        padding: const EdgeInsets.only(right:10),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.arrow_forward_ios),
                      ))
                    ],
                  ),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),

                const SizedBox(
                  height: 15,
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description Product',style: AppTextStyle.textStyleOne(Colors.black, 16, FontWeight.w700),),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ',style: AppTextStyle.textStyleOne(Colors.black, 14, FontWeight.w400),),
                    const SizedBox(height: 15,),
                    Text('The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.  ',style: AppTextStyle.textStyleOne(Colors.black, 14, FontWeight.w400),),


                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
