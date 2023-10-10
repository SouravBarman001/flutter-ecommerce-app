import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/category_product_items_data_source.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/repositories/category_product_items_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryItemsRepoProvider = Provider<CategoryItemsRepo>((ref) {
  return CategoryItemsRepoImpl(
    categoryProductItemDataSource: ref.watch(categoryItemsDataResourceProvider),
  );
});

abstract class CategoryItemsRepo {
  Future<(ErrorModel?, List<String>?)> categoryItems();
}
