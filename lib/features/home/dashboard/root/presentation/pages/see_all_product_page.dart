import 'package:badges/badges.dart' as badges;
import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/featured_product_provider.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/helper/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

part '../widgets/see_all_products_app_bar.dart';
part '../widgets/see_all_products_search.dart';
part '../widgets/see_all_products_section.dart';

class SeeAllProductsPage extends ConsumerStatefulWidget {
  const SeeAllProductsPage({super.key});

  @override
  ConsumerState<SeeAllProductsPage> createState() => _SeeAllProductsPageState();
}

class _SeeAllProductsPageState extends ConsumerState<SeeAllProductsPage> {
  FocusNode myFocusNode = FocusNode();

  Future<void> fetchProducts() async {
    await Future(() {
      ref.read(featuredProductNotifierProvider.notifier).limitList.clear();
      ref.read(featuredProductNotifierProvider.notifier).fetchLimitProduct(
        ref.read(featuredProductNotifierProvider.notifier).limitData,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: _SeeAllProductsAppBar(),
        body: RefreshIndicator(
          onRefresh: fetchProducts,
          child: ListView(
            children: [
              SeeAllProductsSearch(
                categoryName: 'Featured Products',
                focusNode: myFocusNode,
              ),
              SizedBox(
                height: ScreenUtil().screenHeight * 0.7,
                width: double.infinity,
                child: const SeeAllProductsSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
