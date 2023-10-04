import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/media_query_size.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/home/home_core/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/pages/best_sellers.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/pages/new_arrival.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/riverpod/featured_product_provider.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/constant/product_resource.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/details_product_review.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/helper/dialog_helper.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/home_banner.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/widgets/product_details_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:input_form_field/input_form_field.dart';

part './product_details.dart';
part '../widgets/category_product_items.dart';
part '../widgets/featured_items.dart';
part '../widgets/home_body.dart';
part '../widgets/product_details_seller_info_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(featuredProductNotifierProvider.notifier).fetchFeaturedProduct();
    });
  }


  final _searchController = TextEditingController();

  Map<String, String> categoryItems = {
    'Fashion': 'fashion.png',
    'Foods': 'foods.png',
    'Gadget': 'gadget.png',
    'Gift': 'gift.png',
    'Souvenir': 'souvenir.png',
  };

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(featuredProductNotifierProvider);
    late List<FeaturedModel> featuredModels;
    if (state.status == Status.success) {
       featuredModels = state.data;
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const HomeAppBar(),
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
                        const Color(0xffC4C5C4),
                        14,
                        FontWeight.w400,
                      ),
                      hintText: 'Search Product Name',
                      borderType: BorderType.none,
                      errorTextStyle:
                          const TextStyle(fontSize: 13, color: Colors.red),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 15,
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            context.push('/${Routers.homeRoot}/search-product');
                          });
                          HapticFeedback.mediumImpact();
                        },
                        child: const Icon(
                          CupertinoIcons.search,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const HomeBanner(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: AppTextStyle.textStyleOne(
                            Colors.black,
                            16,
                            FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            DialogHelper.showCategoryDialog(context);
                          },
                          child: Text(
                            'See All',
                            style: AppTextStyle.textStyleOne(
                              Colors.blue,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _CategoryProductItems(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              if (state.status == Status.success)
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredModels.length,
                    itemBuilder: (BuildContext context, int index) {
                      final entry = featuredModels[index];
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
                          children: [
                            // Display the key
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  HapticFeedback.heavyImpact();
                                  context.push('/product-details',
                                      extra: entry,);
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      entry.image,
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
                                      'product name',
                                      style: AppTextStyle.textStyleOne(
                                        Colors.black,
                                        14,
                                        FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      entry.price.toString(),
                                      style: AppTextStyle.textStyleOne(
                                        const Color(0xffFE3A30),
                                        14,
                                        FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Flexible(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xffFFC120),
                                                size: 15,
                                              ),
                                              Text(
                                                '4',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Flexible(
                                          flex: 3,
                                          child: Text(
                                            '2 Reviews',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: GestureDetector(
                                            onTap: () {
                                              HapticFeedback.heavyImpact();
                                              DialogHelper.actionPopPup(
                                                context,
                                              );
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
                )
              else
                const CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              ),
              const HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
