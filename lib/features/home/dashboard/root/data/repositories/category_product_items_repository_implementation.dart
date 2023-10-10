import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/category_product_items_data_source.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/category_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/domain/repositories/category_product_items_repository.dart';

class CategoryItemsRepoImpl implements CategoryItemsRepo {
  CategoryItemsRepoImpl({
    required this.categoryProductItemDataSource,
  });

  CategoryProductItemDataSource categoryProductItemDataSource;

  @override
  Future<(ErrorModel?, List<String>?)> categoryItems() async {
    return categoryProductItemDataSource.categoryItems().guard((data) {
      return categoryModelFromJson(data);
    });
  }
}
