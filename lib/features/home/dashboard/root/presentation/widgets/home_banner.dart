import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/widgets/constant/product_resource.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: ProductResource.images.length,
      itemBuilder: (context, index, realIndex) {
        final imageUrl = ProductResource.images[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }
}
