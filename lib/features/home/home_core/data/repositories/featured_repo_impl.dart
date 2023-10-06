import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/home_core/data/data_sources/featured_data_scource.dart';
import 'package:ecommerce_module/features/home/home_core/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/home_core/domain/repositories/featured_repo.dart';

class FeaturedRepoImpl implements FeaturedRepo {
  FeaturedRepoImpl({
    required this.featuredDataSource,
  });

  FeaturedDataSource featuredDataSource;

  @override
  Future<(ErrorModel?, List<FeaturedModel>?)> featuredProducts() async {
    return featuredDataSource.featuredItems().guard(
      (data) {
        final featuredModels = List<FeaturedModel>.from(
          (data as List).map(
            (item) => FeaturedModel.fromJson(item),
          ),
        );

        return featuredModels;
      },
    );
  }
}
