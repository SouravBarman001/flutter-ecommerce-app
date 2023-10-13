import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/media_query_size.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/best_sellers.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/new_arrival.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/category_item_provider.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/featured_product_provider.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/details_product_review.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/helper/dialog_helper.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/home_banner.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/product_details_app_bar.dart';
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
    Future(() {
      ref.read(connectivityStatusProviders.notifier).checkStatus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(connectivityStatusProviders.notifier).dispose();
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
                    const CategoryProductItems(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
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
