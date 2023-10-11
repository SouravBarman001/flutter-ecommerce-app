import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/featured_product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailsNotifier extends Notifier<BaseState> {
  List<FeaturedModel> allProducts = [];

  @override
  BaseState build() {
    final featuredProductNotifier =
        ref.read(featuredProductNotifierProvider.notifier);
    allProducts = featuredProductNotifier.allProducts;
    return BaseState();
  }

  Future<void> fetchFilteredCategoryItems(String category) async {
    try {
      if (allProducts.isNotEmpty) {
        final filteredList = allProducts
            .where((element) => element.category == category.toLowerCase())
            .toList();

        if (filteredList.isEmpty) {
          state = state.copyWith(
            status: Status.error,
            message: 'Sorry! There is no data',
          );
        } else {
          state = state.copyWith(
            status: Status.success,
            data: filteredList,
          );
          Log.debug('filtered-list ${filteredList[0].description}');
        }
      } else {
        Log.debug('ElSE CASE : fetchFilteredCategoryItems');

        state = state.copyWith(
          status: Status.error,
          message: 'Sorry! There is no data',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: Status.error,
        message: 'Sorry! There is no data',
      );
    }
  }
}
