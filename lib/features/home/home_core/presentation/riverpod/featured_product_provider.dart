import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/riverpod/featured_product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuredProductNotifierProvider =
    NotifierProvider<FeaturedProductNotifier, BaseState>(
  FeaturedProductNotifier.new,
);
