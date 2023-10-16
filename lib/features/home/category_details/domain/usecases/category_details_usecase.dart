import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/model/category_details_model.dart';
import 'package:ecommerce_module/features/home/category_details/domain/repositories/category_details_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDetailsUseCaseProvider = Provider<CategoryDetailsUseCase>(
  (ref) => CategoryDetailsUseCase(
    categoryDetailsRemoteRepository:
        ref.watch(categoryDetailsRemoteRepoProvider),
  ),
);

class CategoryDetailsUseCase {
  CategoryDetailsUseCase({
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
