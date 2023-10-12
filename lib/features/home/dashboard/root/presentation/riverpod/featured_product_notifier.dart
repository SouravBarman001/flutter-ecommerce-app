import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/domain/usecases/featured_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProductNotifier extends Notifier<BaseState> {
  late final FeaturedProductUseCases featuredProductUseCases;
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  final List<String> recentSearches = [];
  late List<FeaturedModel> limitList = [];
  late List<FeaturedModel> allProducts = [];
  int limitData = 5;

  @override
  BaseState build() {
    featuredProductUseCases = ref.read(featuredUseCaseProvider);
    scrollController.addListener(_scrollListener);
    return BaseState();
  }

  Future<void> fetchLimitProduct(int limit) async {
    state = state.copyWith(
      status: Status.loading,
    );

    try {
      final (errorModel, featuredModels) =
          await featuredProductUseCases.limitProductList(limit);

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
        );
        limitList = featuredModels;
      }
    } catch (e) {
      state = state.copyWith(
        status: Status.error,
        message: e.toString(),
      );
    }
  }

  void searchProducts(String item) {
    try {
      if (limitList.isNotEmpty) {
        final filteredList = limitList
            .where(
              (element) =>
                  element.title.toLowerCase().contains(item.toLowerCase()),
            )
            .toList();

        if (filteredList.isEmpty) {
          state = state.copyWith(
            status: Status.error,
            message: 'Sorry! There is no data',
          );
        } else {
          limitList.clear();
          state = state.copyWith(
            status: Status.success,
          );
          limitList = filteredList;
        }
      } else {
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
        allProducts = featuredModels;
      }
    } catch (e) {
      state = state.copyWith(
        status: Status.error,
        message: e.toString(),
      );
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      limitData += 5;
      fetchLimitProduct(limitData);
    } else {}
  }
}
