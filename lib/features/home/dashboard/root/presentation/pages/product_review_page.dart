import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../data/domain/user_model.dart';

part '../widgets/product_review_page_app_bar.dart';
part '../widgets/product_review_page_rating_section.dart';
part '../widgets/product_review_page_review_section.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ProductReviewPageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
           _ProductReviewPageRatingSection(),
            _ProductReviewPageReviewSection(),
          ],
        ),
      ),
    );
  }
}
