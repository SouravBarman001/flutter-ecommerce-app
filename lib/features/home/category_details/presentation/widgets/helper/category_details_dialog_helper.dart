import 'package:ecommerce_module/features/home/category_details/presentation/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
class CategoryDetailsDialogHelper{
  static void showDialogBox(BuildContext context) {
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
          child: ShowDialogWidget(
            ctx: ctx,
          ),
        ),
      ),
    );
  }


}