import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/data_source/category_details_data_source.dart';
import 'package:ecommerce_module/features/home/category_details/data/model/category_details_model.dart';
import 'package:ecommerce_module/features/home/category_details/domain/repositories/category_details_remote_repository.dart';

class CategoryDetailsRemoteRepositoryImpl
    extends CategoryDetailsRemoteRepository {
  CategoryDetailsRemoteRepositoryImpl({
    required this.categoryDetailsDataSource,
  });

  CategoryDetailsDataSource categoryDetailsDataSource;

  @override
  Future<(ErrorModel?, List<CategoryDetailsModel>?)> categoryProducts(
    String categoryName,
  ) async {
    return categoryDetailsDataSource.categoryItems(categoryName).guard(
      (data) {
        final categoryModels = List<CategoryDetailsModel>.from(
          (data as List).map(
            (item) => CategoryDetailsModel.fromJson(item),
          ),
        );

        return categoryModels;
      },
    );
  }
}
