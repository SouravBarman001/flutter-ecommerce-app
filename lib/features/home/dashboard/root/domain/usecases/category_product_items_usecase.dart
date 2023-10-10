import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/domain/repositories/category_product_items_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryItemUseCaseProvider = Provider<CategoryItemUseCases>(
  (ref) => CategoryItemUseCases(
    categoryItemsRepo: ref.watch(categoryItemsRepoProvider),
  ),
);

class CategoryItemUseCases {
  CategoryItemUseCases({
    required this.categoryItemsRepo,
  });

  final CategoryItemsRepo categoryItemsRepo;

  Future<(ErrorModel?, List<String>?)> categoryItems() async {
    final response = await categoryItemsRepo.categoryItems();
    return response;
  }
}
