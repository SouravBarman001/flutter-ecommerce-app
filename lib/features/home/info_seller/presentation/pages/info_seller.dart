import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/home/info_seller/presentation/widgets/helper/seller_info_dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../dashboard/root/data/domain/featured_product_model.dart';
part '../widgets/seller_app_bar.dart';
part '../widgets/seller_bottom_bar.dart';
part '../widgets/seller_products.dart';
part '../widgets/seller_information.dart';
part '../widgets/seller_profile.dart';

class InfoSeller extends StatefulWidget {
  const InfoSeller({super.key});

  @override
  State<InfoSeller> createState() => _InfoSellerState();
}

class _InfoSellerState extends State<InfoSeller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SellerAppBar(),
      bottomNavigationBar: _SellerBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _SellerProfile(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'images/icons/marker-time.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'West Java, Bandung (Opening Hours 08:00-21:00)',
                    style: AppTextStyle.textStyleOne(
                      Colors.black,
                      12,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _SellerInformation(),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Support',
                    style: AppTextStyle.textStyleOne(
                      Colors.black,
                      15,
                      FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      SellerInfoDialogHelper.shippingDialogBox(context);
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            _SellerProducts(),
          ],
        ),
      ),
    );
  }
}
