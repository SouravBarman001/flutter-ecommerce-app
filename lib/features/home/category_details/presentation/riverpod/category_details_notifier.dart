import 'package:core/core.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ecommerce_module/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:ecommerce_module/features/home/category_details/domain/usecases/category_details_usecase.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/featured_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailsNotifier extends Notifier<BaseState> {
  List<FeaturedModel> allProducts = [];
  final TextEditingController searchController = TextEditingController();
  final List<String> recentSearches = [];

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

  Future<void> searchProducts(String item, String category) async {
    try {
      if (allProducts.isNotEmpty) {
        final filteredList = allProducts
            .where(
              (element) =>
                  element.title.toLowerCase().contains(item.toLowerCase()) &&
                  element.category == category.toLowerCase(),
            )
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

  Future<void> categoryProductFetch(String categoryName) async {
    state = state.copyWith(
      status: Status.loading,
    );

    try {
      final (errorModel, categoryDetailsModel) = await ref
          .read(categoryDetailsUseCaseProvider)
          .categoryProductList(categoryName);

      if (errorModel != null) {
        state = state.copyWith(
          status: Status.error,
          message: errorModel.message,
        );
      } else if (categoryDetailsModel!.isNotEmpty) {
        state = state.copyWith(
          status: Status.success,
          data: categoryDetailsModel,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: Status.error,
        message: e.toString(),
      );
    }
  }

  Future<void> chooseOperationBasedOnNetworkConnectivity(
    String selectedCategory,
  ) async {
    final internetState = ref.watch(connectivityStatusProviders);
    if (internetState.connectivityStatus == ConnectivityStatus.isDisconnected) {
      await Future(() {
        fetchFilteredCategoryItems(selectedCategory);
      });
    } else if (internetState.connectivityStatus ==
        ConnectivityStatus.isConnected) {
      await Future(() {
        categoryProductFetch(selectedCategory);
      });
    }
  }
}
