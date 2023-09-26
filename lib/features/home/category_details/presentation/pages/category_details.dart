import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/home/category_details/presentation/widgets/show_dialog.dart';
import 'package:ecommerce_module/features/home/home_core/data/domain/featured_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/helper/category_details_dialog_helper.dart';
part '../widgets/category_details_app_bar.dart';
part '../widgets/category_details_bottom_bar.dart';
part '../widgets/category_search.dart';
part '../widgets/category_products.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({required this.categoryName, super.key});
  final String categoryName;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  FocusNode myFocusNode = FocusNode();

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
                  categoryName: widget.categoryName, focusNode: myFocusNode,),
              _CategoryProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
