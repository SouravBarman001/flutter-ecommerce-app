import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/category_product_items_data_source_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryItemsDataResourceProvider =
    Provider<CategoryProductItemDataSource>((ref) {
  return CategoryProductItemDataSourceImpl(client: ref.watch(networkProvider));
});

abstract class CategoryProductItemDataSource {
  Future<Response> categoryItems();
}
