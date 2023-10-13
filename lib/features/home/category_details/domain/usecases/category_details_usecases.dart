import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/model/category_details_model.dart';
import 'package:ecommerce_module/features/home/category_details/domain/repositories/category_details_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDetailsUseCaseProvider = Provider<CategoryDetailsUseCases>(
  (ref) => CategoryDetailsUseCases(
    categoryDetailsRemoteRepository:
        ref.watch(categoryDetailsRemoteRepoProvider),
  ),
);

class CategoryDetailsUseCases {
  CategoryDetailsUseCases({
    required this.categoryDetailsRemoteRepository,
  });

  final CategoryDetailsRemoteRepository categoryDetailsRemoteRepository;

  Future<(ErrorModel?, List<CategoryDetailsModel>?)> categoryProductList(
    String categoryName,
  ) async {
    final response =
        await categoryDetailsRemoteRepository.categoryProducts(categoryName);
    return response;
  }
}
