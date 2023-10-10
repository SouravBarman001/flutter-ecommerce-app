import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/featured_data_scource.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/repositories/featured_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featureRepoProvider = Provider<FeaturedRepo>((ref) {
  return FeaturedRepoImpl(
    featuredDataSource: ref.watch(featuredDataResourceProvider),
  );
});

abstract class FeaturedRepo {
  Future<(ErrorModel?, List<FeaturedModel>?)> featuredProducts();
  Future<(ErrorModel?, List<FeaturedModel>?)> limitFeaturedProducts(int limit);
}
