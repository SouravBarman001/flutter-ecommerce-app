import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../../core/constant/media_query_size.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../core/router/routers.dart';
import '../../data/domain/featured_product_model.dart';
import '../../data/domain/user_model.dart';
import '../widgets/product_action_dialog.dart';

@immutable
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.data});
  final FeaturedProductModel data;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void _actionPopPup(BuildContext context) {
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
          width: MediaQuery.of(context).size.width - 100,
          child: ProductActionDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }

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
                  context.goNamed(RoutersName.homeRoot);
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
                'Detail Product',
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
                    child: Image.network(
                      widget.data.imgUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 10, bottom: 5),
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
                          Colors.black,
                          24.0,
                          FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Rp. 1.500.000',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xffFE3A30),
                          16.0,
                          FontWeight.w600,
                        ),
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
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${widget.data.review.toString()} Reviews',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Available : 250',
                                style: AppTextStyle.textStyleOne(
                                  const Color(0xff3A9B7A),
                                  12,
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    context.push('/product-details/info-seller');
                  },
                  child: Container(
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
                            color: const Color(
                              0xfffafafa,
                            ), //   const Color(0xfffafafa),
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
                            // color: Colors.red,
                            padding: const EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
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
                    Text(
                      'Description Product',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        16,
                        FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'The speaker unit contains a diaphragm that is '
                      'precision-grown from NAC Audio bio-cellulose, '
                      'making it stiffer, lighter and stronger than'
                      ' regular PET speaker units, and allowing the'
                      ' sound-producing diaphragm to vibrate without '
                      'the levels of distortion found in other speakers. ',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        14,
                        FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'The speaker unit contains a diaphragm that is '
                      'precision-grown from NAC Audio bio-cellulose, '
                      'making it stiffer, lighter and stronger'
                      ' than regular PET speaker units, and allowing '
                      'the sound-producing diaphragm to vibrate without'
                      ' the levels of distortion found in other speakers.',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        14,
                        FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Review (86)',
                        style: AppTextStyle.textStyleOne(
                          Colors.black,
                          16,
                          FontWeight.w700,
                        ),
                      ),
                      Row(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape
                                        .circle, // Make the container circular
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      UserModel.users[index].imgUrl.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  height: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yelena Belova',
                                        style: AppTextStyle.textStyleOne(
                                          Colors.black,
                                          14,
                                          FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0,
                                        ),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_outlined,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.only(top: 10),
                                  height: double.infinity,
                                  child: const Text(' 2 weeks ago'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: double.infinity,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur '
                                    'adipiscing elit,'
                                    ' sed do eiusmod tempor '
                                    'incididunt ut labore et dolore magna aliqua.',
                                    style: AppTextStyle.textStyleOne(
                                      Colors.black,
                                      12,
                                      FontWeight.w400,
                                    ),
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    HapticFeedback.mediumImpact();
                    context.push('/product-details/product-review');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xff0C1A30),
                      ),
                    ),
                    child: Text(
                      'See All Review',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff0C1A30),
                        14,
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Product',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        16.0,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: AppTextStyle.textStyleOne(
                        Colors.blue,
                        16.0,
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  height: 250,
                  // color: Colors.lightGreen,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: FeaturedProductModel.listItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final entry = FeaturedProductModel.listItems[index];
                      return Container(
                        height: 242,
                        width: 156,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                          top: 5,
                          right: 5,
                          left: 5,
                          bottom: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Display the key
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  HapticFeedback.heavyImpact();
                                  context.push(
                                    '/product-details',
                                    extra: entry,
                                  );
                                },
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                        Flexible(
                                          flex: 2,
                                          child: GestureDetector(
                                            onTap: () {
                                              HapticFeedback.heavyImpact();
                                              _actionPopPup(context);
                                            },
                                            child: const Icon(
                                              Icons.more_vert_outlined,
                                              color: Color(0xffFFC120),
                                              size: 15,
                                            ),
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
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
