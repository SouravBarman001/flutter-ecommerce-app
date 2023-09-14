import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:input_form_field/input_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'best_sellers.dart';
import 'new_arrival.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  int _currentIndex = 0;
  List<String> images = [
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/12/E-commerce-Product-Banner-Design-scaled.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Professional-E-Commerce-Shoes-Banner-Design.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/06/Free-E-commerce-Product-Banner-Design-with-Green-Colors-scaled.jpg',
    'https://img.freepik.com/free-psd/banner-template-with-online-shopping_23-2148545455.jpg',
  ];
  Map<String, String> categoryItems = {
    "Fashion": "fashion.png",
    "Foods": "foods.png",
    "Gadget": "gadget.png",
    "Gift": "gift.png",
    "Souvenir": "souvenir.png",
  };
  Map<String, String> featuredItems = {
    "Premium chair":
        "https://servex-us.com/wp-content/uploads/2019/11/3d-visualization-white-background-renderings-office-furniture-manufacturers-LP7.jpg",
    "Skin formula":
        "https://5.imimg.com/data5/SELLER/Default/2022/1/VP/OV/VN/104752620/photography-white-background-500x500.jpg",
    "Milk & Honey":
        "https://img.pixelz.com/blog/white-background-photography/product-photo-liqueur-bottle-1000.jpg",
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                    //color: Colors.blue,
                    )),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Mega Mall',
                  style: AppTextStyle.textStyleOne(
                      const Color(0xff3669C9), 18.0, FontWeight.w700),
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
                        child: Stack(
                          children: [
                            badges.Badge(
                              position:
                                  badges.BadgePosition.topEnd(top: -9, end: -1),
                              showBadge: true,
                              ignorePointer: false,
                              badgeContent: const Text(''),
                              child: Positioned(
                                child: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                    'images/home_page_icons/bell.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    InputFormField(
                      borderRadius: BorderRadius.circular(10),
                      fillColor: const Color(0xfffafafa),
                      textEditingController: _searchController,
                      hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4), 14.0, FontWeight.w400),
                      hintText: "Search Product Name",
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {});
                            HapticFeedback.mediumImpact();
                          },
                          child: const Icon(
                            CupertinoIcons.search,
                            color: Colors.black,
                            size: 28,
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final imageUrl = images[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                                  Image.network(imageUrl, fit: BoxFit.cover)),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        aspectRatio: 16 / 9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: AppTextStyle.textStyleOne(
                              Colors.black, 16.0, FontWeight.w600),
                        ),
                        Text(
                          'See All',
                          style: AppTextStyle.textStyleOne(
                              Colors.blue, 16.0, FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                            onTap: () => HapticFeedback.heavyImpact(),
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
                                      )),
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
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                // height: 300,
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                width: double.infinity,
                color: const Color(0xfffafafa),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured Product',
                          style: AppTextStyle.textStyleOne(
                              Colors.black, 16.0, FontWeight.w600),
                        ),
                        Text(
                          'See All',
                          style: AppTextStyle.textStyleOne(
                              Colors.blue, 16.0, FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      height: 250,
                     // color: Colors.lightGreen,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final entry = featuredItems.entries.elementAt(index);
                          final key = entry.key;
                          final value = entry.value;
                          return GestureDetector(
                            onTap: () => HapticFeedback.heavyImpact(),
                            child: Container(
                              height: 242,
                              width: 156,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,

                              ),
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 5, right: 5,left: 5,bottom: 5),
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
                                            child: Image.network(value,
                                                fit: BoxFit.cover),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 5),
                                          width: double.infinity,
                                      //    color: Colors.grey,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                key.toString(),
                                                style: AppTextStyle.textStyleOne(Colors.black, 14.0, FontWeight.w600),
                                              ),
                                              Text(
                                                "Rp. 1.500.000",
                                                style: AppTextStyle.textStyleOne(const Color(0xffFE3A30), 14.0, FontWeight.w700),
                                              ),
                                              const Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible( flex: 2, child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(Icons.star,color: Color(0xffFFC120),size: 15,),
                                                      Text('4.5',style: TextStyle(fontSize: 10),)
                                                    ],
                                                  )),
                                                  Flexible( flex: 3,child:  Text('86 Reviews',style: TextStyle(fontSize: 10),)),
                                                  Flexible(flex: 2,child:  Icon(Icons.more_vert_outlined,color: Color(0xffFFC120),size: 15,)),
                                                ],
                                              ),
                                            ],
                                          ))), // Display the corresponding image
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Best Sellers
                    BestSellers(featuredItems : featuredItems),
                    const SizedBox(
                      height: 10,
                    ),

                    /// New Arrival

                    NewArrival(featuredItems: featuredItems,),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
