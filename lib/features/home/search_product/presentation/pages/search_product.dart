import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/text_style.dart';
import '../../../home_core/data/domain/featured_product_model.dart';
import '../../../home_core/presentation/pages/best_sellers.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [];

  bool recentSearch = false;

  List<String> images = [
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/12/E-commerce-Product-Banner-Design-scaled.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Professional-E-Commerce-Shoes-Banner-Design.jpg',
    'https://graphicsfamily.com/wp-content/uploads/edd/2022/06/Free-E-commerce-Product-Banner-Design-with-Green-Colors-scaled.jpg',
    'https://img.freepik.com/free-psd/banner-template-with-online-shopping_23-2148545455.jpg',
  ];
  Map<String, String> categoryItems = {
    'Fashion': 'fashion.png',
    'Foods': 'foods.png',
    'Gadget': 'gadget.png',
    'Gift': 'gift.png',
    'Souvenir': 'souvenir.png',
  };
  Map<String, String> featuredItems = {
    'Premium chair':
        'https://servex-us.com/wp-content/uploads/2019/11/3d-visualization-white-background-renderings-office-furniture-manufacturers-LP7.jpg',
    'Skin formula':
        'https://5.imimg.com/data5/SELLER/Default/2022/1/VP/OV/VN/104752620/photography-white-background-500x500.jpg',
    'Milk & Honey':
        'https://img.pixelz.com/blog/white-background-photography/product-photo-liqueur-bottle-1000.jpg',
  };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          recentSearch = !recentSearch;
        });
      },
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
              child: GestureDetector(
                onTap: () {
                  context.pop();
                  HapticFeedback.vibrate();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Search',
                  style: AppTextStyle.textStyleOne(
                    Colors.black,
                    16.0,
                    FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                  //color: Colors.greenAccent,
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
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffafafa),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: Color(0xffC4C5C4),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: 'Search Product Name',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 15,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Perform search here
                                    final String searchTerm =
                                        _searchController.text;
                                    // Add the search term to recent searches
                                    if (searchTerm.isNotEmpty) {
                                      _recentSearches.add(searchTerm);
                                      _searchController.clear();
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ),
                            onEditingComplete: () {
                              setState(() {
                                final String searchTerm =
                                    _searchController.text;
                                // Add the search term to recent searches
                                if (searchTerm.isNotEmpty) {
                                  _recentSearches.add(searchTerm);
                                  recentSearch = false;
                                  _searchController.clear();
                                } else if (searchTerm.isEmpty) {
                                  _searchController.clear();
                                  recentSearch = false;
                                  FocusScope.of(context).unfocus();
                                }
                              });
                            },
                            onTap: () {
                              setState(() {
                                recentSearch = !recentSearch;
                              });
                            },
                            controller: _searchController,
                          ),
                          recentSearch == true
                              ? Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Recent Searches',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      ListView.builder(
                                        // reverse: true,
                                        shrinkWrap: true,
                                        itemCount: _recentSearches.length > 5
                                            ? 5
                                            : _recentSearches.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final int reversedIndex =
                                              _recentSearches.length -
                                                  1 -
                                                  index;
                                          return SizedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(Icons.search),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        _recentSearches[
                                                            reversedIndex],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.clear,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _recentSearches
                                                              .removeAt(
                                                            reversedIndex,
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _recentSearches.clear();
                                            });
                                          },
                                          child: const Text('Clear All'),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                          return GestureDetector(
                            onTap: () {
                              HapticFeedback.heavyImpact();
                              context.push('/product-details', extra: entry);
                            },
                            child: Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                  'Reviews',
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
                                  ), // Display the corresponding image
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    /// Best Sellers
                    BestSellers(featuredItems: featuredItems),
                    const SizedBox(
                      height: 10,
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
