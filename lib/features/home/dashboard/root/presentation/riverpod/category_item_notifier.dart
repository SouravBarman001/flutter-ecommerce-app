import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/domain/usecases/category_product_items_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItemNotifier extends Notifier<BaseState> {
  late final CategoryItemUseCases categoryItemUseCases;

  @override
  BaseState build() {
    categoryItemUseCases = ref.read(categoryItemUseCaseProvider);
    return BaseState();
  }

  Future<void> fetchCategoryItems() async {
    state = state.copyWith(
      status: Status.loading,
    );

    try {
      final (errorModel, categories) =
          await categoryItemUseCases.categoryItems();

      if (errorModel != null) {
        ErrorModel(
          message: errorModel.message,
          code: errorModel.code,
          stack: errorModel.stack,
        );

        state = state.copyWith(
          status: Status.error,
          message: errorModel.message,
        );
      } else if (categories!.isNotEmpty) {
        state = state.copyWith(
          status: Status.success,
          data: categories,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: Status.error,
        message: e.toString(),
      );
    }
  }
}
