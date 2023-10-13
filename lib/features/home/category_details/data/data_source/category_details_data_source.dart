import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/data_source/category_details_data_source_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDetailsDataResourceProvider =
    Provider<CategoryDetailsDataSource>((ref) {
  return CategoryDetailsDataSourceImpl(
    client: ref.watch(networkProvider),
  );
});

abstract class CategoryDetailsDataSource {
  Future<Response> categoryItems(String categoryName);
}
