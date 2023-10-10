import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/category_dialog.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/product_action_dialog.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/see_all_products_search_filter_dialog.dart';
import 'package:flutter/material.dart';

class DialogHelper{

  static void showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: CategoryDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }

  static void actionPopPup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: ProductActionDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }

  static void seeAllProductsSearchFilter(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: SeeAllProductSearchFilterDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }


}
