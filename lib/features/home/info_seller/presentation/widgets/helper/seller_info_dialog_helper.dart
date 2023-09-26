import 'package:ecommerce_module/features/home/info_seller/presentation/widgets/info_seller_dialog.dart';
import 'package:ecommerce_module/features/home/info_seller/presentation/widgets/shipping_dialog.dart';
import 'package:flutter/material.dart';

class SellerInfoDialogHelper{
 static void infoSellerDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: InfoSellerDialog(
            ctx: ctx,
          ),
        ),
      ),
    );
  }

 static void shippingDialogBox(BuildContext context) {
   showDialog(
     context: context,
     builder: (ctx) => AlertDialog(
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(
           Radius.circular(10),
         ),
       ),
       insetPadding:  EdgeInsets.zero,
       contentPadding:  EdgeInsets.zero,
       content: SizedBox(
         width: MediaQuery.of(context).size.width - 50,
         child: ShippingDialog(
           ctx: ctx,
         ),
       ),
     ),
   );
 }
}
