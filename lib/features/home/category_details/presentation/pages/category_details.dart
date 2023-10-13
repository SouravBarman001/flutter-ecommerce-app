import 'package:badges/badges.dart' as badges;
import 'package:core/core.dart';
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ecommerce_module/features/home/category_details/presentation/riverpod/category_details_provider.dart';
import 'package:ecommerce_module/features/home/category_details/presentation/widgets/helper/category_details_dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

part '../widgets/category_details_app_bar.dart';
part '../widgets/category_details_bottom_bar.dart';
part '../widgets/category_products.dart';
part '../widgets/category_search.dart';

class CategoryDetails extends ConsumerStatefulWidget {
  const CategoryDetails({required this.categoryName, super.key});
  final String categoryName;

  @override
  ConsumerState<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends ConsumerState<CategoryDetails> {
  FocusNode myFocusNode = FocusNode();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = ref.watch(connectivityStatusProviders);
    if (state.connectivityStatus == ConnectivityStatus.isDisconnected) {
      Future(() {
        ref
            .read(categoryFilteredNotifierProvider.notifier)
            .fetchFilteredCategoryItems(widget.categoryName);
      });
    } else if (state.connectivityStatus == ConnectivityStatus.isConnected) {
      Future(() {
        ref
            .read(categoryFilteredNotifierProvider.notifier)
            .categoryProductFetch(widget.categoryName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFocusNode.unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: _CategoryDetailsBottomBar(),
        appBar: _CategoryDetailsAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _CategorySearch(
                categoryName: widget.categoryName,
                focusNode: myFocusNode,
              ),
              _CategoryProducts(
                categoryName: widget.categoryName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
