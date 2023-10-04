import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/home_core/domain/usecases/featured_product_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProductNotifier extends Notifier<BaseState> {
  late final FeaturedProductUseCases featuredProductUseCases;

  @override
  BaseState build() {
    featuredProductUseCases = ref.read(featuredUseCaseProvider);
    return BaseState();
  }

  Future<void> fetchFeaturedProduct() async {
    state = state.copyWith(
      status: Status.loading,
    );

    try {
      final (errorModel, featuredModels) =
          await featuredProductUseCases.productList();

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
      } else if (featuredModels!.isNotEmpty) {
        state = state.copyWith(
          status: Status.success,
          data: featuredModels,
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
