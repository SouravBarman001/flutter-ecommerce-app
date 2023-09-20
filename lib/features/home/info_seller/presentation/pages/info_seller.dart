import 'package:ecommerce_module/features/home/info_seller/presentation/widgets/info_seller_dialog.dart';
import 'package:ecommerce_module/features/home/info_seller/presentation/widgets/shipping_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../core/constant/text_style.dart';
import '../../../home_core/data/domain/featured_product_model.dart';

class InfoSeller extends StatefulWidget {
  const InfoSeller({super.key});

  @override
  State<InfoSeller> createState() => _InfoSellerState();
}

class _InfoSellerState extends State<InfoSeller> {
  List<String> images = [
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/12/E-commerce-Product-Banner-Design-scaled.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Professional-E-Commerce-Shoes-Banner-Design.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/06/Free-E-commerce-Product-Banner-Design-with-Green-Colors-scaled.jpg',
    'https://img.freepik.com/free-psd/banner-template-with-online-shopping_23-2148545455.jpg',
  ];

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        insetPadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: InfoSellerDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }

  void shippingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        insetPadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: ShippingDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width / 3.3;
    final double cardHeight = MediaQuery.of(context).size.height / 5.0;
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
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Info Seller',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff000000),
                  18.0,
                  FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: 26,
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25,),
        // color: Colors.blue,
        height: 90,
        width: double.infinity,
        color: const Color(0xfffafafa),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                showDialogBox(context);

                HapticFeedback.mediumImpact();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 140.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff0C1A30),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sorting',
                  style: AppTextStyle.textStyleOne(
                    const Color(0xff0C1A30),
                    14.0,
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Follow',
                  style: AppTextStyle.textStyleOne(
                     Colors.white,
                    14.0,
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: const Color(0xffB5D98CFF), //   const Color(0xfffafafa),
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
                            color: const Color(0xfffafafa),
                          ),
                          child: Image.asset(
                            'images/icons/shop.png',
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
                                Colors.black,
                                14,
                                FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Official Store',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    12,
                                    FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset(
                                    'images/icons/shield.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            //  color: Colors.red,
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.star_outlined,
                                  size: 22,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '4.5',
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    16,
                                    FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/icons/marker-time.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'West Java, Bandung (Opening Hours 08:00-21:00)',
                    style: AppTextStyle.textStyleOne(
                      Colors.black,
                      12,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              width: double.infinity,
              // color: Colors.deepPurple.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Followers',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xff838589), 14, FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),

                      Text(
                        '23 Rb',
                        style: AppTextStyle.textStyleOne(
                          Colors.black, 14, FontWeight.w600,),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Product',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xff838589), 14, FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),

                      Text(
                        '150 Item',
                        style: AppTextStyle.textStyleOne(
                          Colors.black, 14, FontWeight.w600,),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xff838589), 14, FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        '20 Oct 2021',
                        style: AppTextStyle.textStyleOne(
                          Colors.black, 14, FontWeight.w600,),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping Support',
                    style: AppTextStyle.textStyleOne(
                      Colors.black, 15, FontWeight.w600,),
                  ),
                  GestureDetector(onTap: (){
                    HapticFeedback.mediumImpact();
                    shippingDialogBox(context);
                  },child: const Icon(Icons.arrow_forward_ios),),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: const Color(0xfffafafa),
              //  height: 500,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                  childAspectRatio: cardWidth / cardHeight,
                  // spacing between columns
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
                itemCount: FeaturedProductModel
                    .listItems.length, // total number of items
                itemBuilder: (context, index) {
                  final entry = FeaturedProductModel.listItems[index];
                  return Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        width: 0.7,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Display the key
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                entry.imgUrl.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 10,
                              right: 10,
                              bottom: 5,
                            ),
                            width: double.infinity,
                            //    color: Colors.grey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  entry.name.toString(),
                                  style: AppTextStyle.textStyleOne(
                                    Colors.black,
                                    14.0,
                                    FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Rp. 1.500.000',
                                  style: AppTextStyle.textStyleOne(
                                    const Color(0xffFE3A30),
                                    14.0,
                                    FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xffFFC120),
                                            size: 15,
                                          ),
                                          Text(
                                            entry.rating.toString(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Text(
                                        '${entry.review.toString()}'
                                        ' Reviews',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    const Flexible(
                                      flex: 2,
                                      child: Icon(
                                        Icons.more_vert_outlined,
                                        color: Color(0xffFFC120),
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
