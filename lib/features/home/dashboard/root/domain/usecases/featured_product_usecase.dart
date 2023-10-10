import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/domain/repositories/featured_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuredUseCaseProvider = Provider<FeaturedProductUseCases>(
  (ref) => FeaturedProductUseCases(
    featuredRepo: ref.watch(featureRepoProvider),
  ),
);

class FeaturedProductUseCases {
  FeaturedProductUseCases({
    required this.featuredRepo,
  });

  final FeaturedRepo featuredRepo;

  Future<(ErrorModel?, List<FeaturedModel>?)> productList() async {
    final response = await featuredRepo.featuredProducts();
    return response;
  }

  Future<(ErrorModel?, List<FeaturedModel>?)> limitProductList(
      int limit,) async {
    final response = await featuredRepo.limitFeaturedProducts(limit);
    return response;
  }
}
