import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

part '../widgets/product_search_fuctionality.dart';
part '../widgets/search_page_app_bar.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: _SearchPageAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _ProductSearchFunctionality(myFocusNode: myFocusNode,),
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
                            16,
                            FontWeight.w600,
                          ),
                        ),
                        Text(
                          'See All',
                          style: AppTextStyle.textStyleOne(
                            Colors.blue,
                            16,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const FeaturedItems(),
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
