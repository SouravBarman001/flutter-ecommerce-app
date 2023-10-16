import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/data_source/category_details_data_source.dart';
import 'package:ecommerce_module/features/home/category_details/data/model/category_details_model.dart';
import 'package:ecommerce_module/features/home/category_details/data/repositories/category_details_remote_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDetailsRemoteRepoProvider =
    Provider<CategoryDetailsRemoteRepository>((ref) {
  return CategoryDetailsRemoteRepositoryImpl(
    categoryDetailsDataSource: ref.watch(categoryDetailsDataResourceProvider),
  );
});

abstract class CategoryDetailsRemoteRepository {
  Future<(ErrorModel?, List<CategoryDetailsModel>?)> categoryProducts(
    String categoryName,
  );
}
